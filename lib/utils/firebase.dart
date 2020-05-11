import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';

import 'storage.dart';

/// Analytics - Initialises and provides helper methods for Firebase Google Analytics
/// Note that RouteAware to track tabs as screens is not currently
/// implemented in the app.
class Analytics {
  static final FirebaseAnalytics analytics = FirebaseAnalytics();
  static final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // Hard enable/disable analytics reporting for the session
  static Future<void> analyticsEnabled(bool enabled) async {
    // Enable or disable analytics reporting for this session
    if (kReleaseMode) {
      await analytics.setAnalyticsCollectionEnabled(enabled);
    }
  }

  // Report appOpen event as it is not reported by default
  static Future<void> analyticsAppOpen() async {
    // Only report to analytics if this is a release build and privacy enabled
    if (kReleaseMode && await Settings.readPrivacy()) {
      await analytics.logEvent(name: 'app_open');
    }
  }

  // Report a specific analytics event
  static Future<void> analyticsEvent(String event, String eventData) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode && await Settings.readPrivacy()) {
      await analytics.logEvent(
        name: event,
        parameters: <String, dynamic>{
          'eventData': eventData,
        },
      );
    }
  }
}
