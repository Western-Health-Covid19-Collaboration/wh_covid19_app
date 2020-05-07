import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';

import 'storage.dart';

/// Analytics - Initialises and provides helper methods for Firebase Google Analytics
class Analytics {
  static const browserEvent = 'urlBrowser';
  static const emailEvent = 'urlEmail';
  static const callEvent = 'urlCall';

  final Settings _settings;
  static final FirebaseAnalytics analytics = FirebaseAnalytics();
  final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Analytics(this._settings);

  Future<void> analyticsAppOpen() async {
    // Only report to analytics if this is a release build and privacy enabled
    if (kReleaseMode && await _settings.readPrivacy()) {
      await analytics.logEvent(name: 'app_open');
    }
  }

  Future<void> analyticsScreen(String screenName) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode && await _settings.readPrivacy()) {
      await analytics.setCurrentScreen(
        screenName: screenName,
      );
    }
  }

  Future<void> analyticsEvent(String event, String eventData) async {
    // Only report to analytics if this is a release build
    if (kReleaseMode && await _settings.readPrivacy()) {
      await analytics.logEvent(
        name: event,
        parameters: <String, dynamic>{
          'eventData': eventData,
        },
      );
    }
  }
}
