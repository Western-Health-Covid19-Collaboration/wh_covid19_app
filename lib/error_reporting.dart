import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';
import 'package:sentry/sentry.dart';

import 'env.dart';
import 'utils/storage.dart';

Future<SentryClient> get _sentryClient async => SentryClient(
      dsn: dsn,
      environmentAttributes: await _environmentEvent,
    );

Future<Event> get _environmentEvent async {
  final packageInfo = await PackageInfo.fromPlatform();
  final deviceInfoPlugin = DeviceInfoPlugin();
  OperatingSystem os;
  Device device;
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfoPlugin.androidInfo;
    os = OperatingSystem(
      name: 'android',
      version: androidInfo.version.release,
    );
    device = Device(
      model: androidInfo.model,
      manufacturer: androidInfo.manufacturer,
      modelId: androidInfo.product,
    );
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfoPlugin.iosInfo;
    os = OperatingSystem(
      name: iosInfo.systemName,
      version: iosInfo.systemVersion,
    );
    device = Device(
      model: iosInfo.utsname.machine,
      family: iosInfo.model,
      manufacturer: 'Apple',
    );
  }
  final environment = Event(
    release: '${packageInfo.version} (${packageInfo.buildNumber})',
    environment: 'production',
    contexts: Contexts(
      operatingSystem: os,
      device: device,
      app: App(
        name: packageInfo.appName,
        version: packageInfo.version,
        build: packageInfo.buildNumber,
      ),
    ),
  );
  return environment;
}

Future<void> flutterOnErrorHandler(FlutterErrorDetails details) async {
  if (kReleaseMode && await Settings.readPrivacy()) {
    // In production mode, send error to the application zone.
    Zone.current.handleUncaughtError(details.exception, details.stack);
  } else {
    // In debug mode, simply print to console.
    FlutterError.dumpErrorToConsole(details);
  }
}

Future<void> reportError(Object error, StackTrace stackTrace) async {
  if (kReleaseMode && await Settings.readPrivacy()) {
    final sentry = await _sentryClient;
    // Send the Exception and Stacktrace to Sentry in Production mode.
    await sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );
  }
}
