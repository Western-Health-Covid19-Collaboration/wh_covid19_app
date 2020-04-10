import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Analytics - Initialises and provides helper methods for Firebase Google Analytics
class Analytics {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> analyticsScreen(String screenName) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode) {
      // Setting the Analytics data
      await analytics.setCurrentScreen(
        screenName: screenName,
      );
    }
  }

  static Future<void> analyticsEvent(String event, String eventData) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode) {
      // Setting the Analytics data
      await analytics.logEvent(
        name: event,
        parameters: <String, dynamic>{
          'eventData': eventData,
        },
      );
    }
  }
}

/// Crash Simulations - only for simulating different levels of crash reporting
class CrashSimulation {
  // Crashlytics caught errors simulation
  static Future<void> simulateCrashlyticsCaughtErrors() async {
    Crashlytics.instance.crash();
  }

  // Flutter caught errors simulation
  static Future<void> simulateFlutterCaughtErrors() async {
    throw StateError('Uncaught error thrown by app.');
  }

  // Uncaught errors simulation
  static Future<void> simulateUncaughtErrors() async {
    Future<void>.delayed(
      const Duration(seconds: 2),
      () {
        // Uncomment to cause crash
        // final list = <int>[];
        // print(list[100]);
      },
    );
  }
}

/// Crash Reporting - Initialise and provide helper methods for Crashlytics
void crashReporting() {
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = false;

  // Pass all uncaught errors from the Flutter framework to Crashlytics
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
}
