import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appState.dart';
import 'error_reporting.dart';
import 'utils/storage.dart';
import 'wh_app.dart';

void main() {
  // Add this, and it should be the first line in main method to ensure no crashes before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // This captures errors reported by the Flutter framework.
  FlutterError.onError = flutterOnErrorHandler;

  // Lets not show end users the red screen of death
  if (kReleaseMode) {
    ErrorWidget.builder = (error) {
      flutterOnErrorHandler(error);
      return Container();
    };
  }

  // This creates a [Zone] that contains the Flutter application and establishes
  // an error handler that captures errors.
  //
  // Using a zone makes sure that as many errors as possible are captured,
  // including those thrown from [Timer]s, microtasks, I/O, and those forwarded
  // from the `FlutterError` handler above.
  runZoned<Future<void>>(() async {
    final storedPrivacyState = await Settings.readPrivacy();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PrivacyStateNotifier(storedPrivacyState),
          ),
        ],
        child: const WHApp(),
      ),
    );
  }, onError: (Object error, StackTrace stackTrace) {
    // Whenever an error occurs, call the `reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    reportError(error, stackTrace);
  });
}
