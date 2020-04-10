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

  Future<void> analyticsScreen(String screenName) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode) {
      // Setting the Analytics data
      await analytics.setCurrentScreen(
        screenName: screenName,
      );
    }
  }

  Future<void> analyticsEvent(String event, String eventData) async {
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

/// Crash Reporting - Initialise and provide helper methods for Crashlytics
class CrashReporting {
  void init() {
    // Set `enableInDevMode` to true to see reports while in debug mode
    // This is only to be used for confirming that reports are being
    // submitted as expected. It is not intended to be used for everyday
    // development.
    Crashlytics.instance.enableInDevMode = false;

    // Pass all uncaught errors from the Flutter framework to Crashlytics
    FlutterError.onError = Crashlytics.instance.recordFlutterError;
  }

  /// WARNING - Leave these here and commented out unless simulating errors
  /// Retaining this code to allow future verification of crash reporting.
  //  void simulateCrashlyticsCaughtErrors() async {
  //    // Crashlytics caught errors simulation
  //    Crashlytics.instance.crash();
  //  }
  //
  //  void simulateFlutterCaughtErrors() async {
  //    // Flutter caught errors simulation
  //    throw StateError('Uncaught error thrown by app.');
  //  }
  //
  //  void simulateUncaughtErrors() async {
  //    // Uncaught errors simulation
  //    Future<void>.delayed(
  //      const Duration(seconds: 2),
  //      () {
  //        List<int> list = <int>[];
  //        print(list[100]);
  //      },
  //    );
  //  }

  CrashReporting() {
    init();

    /// WARNING - Leave these here and commented out unless simulating errors
    /// Retaining this code to allow future verification of crash reporting.
    // simulateCrashlyticsCaughtErrors();
    // simulateFlutterCaughtErrors();
    // simulateUncaughtErrors();
  }
}
