import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';

import 'storage.dart';

/// Analytics - Initialises and provides helper methods for Firebase Google Analytics
class Analytics {
  static final FirebaseAnalytics analytics = FirebaseAnalytics();
  static final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> analyticsAppOpen() async {
    // Only report to analytics if this is a release build and privacy enabled
    if (kReleaseMode && await Settings.readPrivacy()) {
      print("**** Sending Analytics");
      await analytics.logEvent(name: 'app_open');
    }
  }

  static Future<void> analyticsScreen(String screenName) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode && await Settings.readPrivacy()) {
      print("**** Sending Analytics");
      await analytics.setCurrentScreen(
        screenName: screenName,
      );
    }
  }

  static Future<void> analyticsEvent(String event, String eventData) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode && await Settings.readPrivacy()) {
      print("**** Sending Analytics");
      await analytics.logEvent(
        name: event,
        parameters: <String, dynamic>{
          'eventData': eventData,
        },
      );
    }
  }
}
