import 'package:flutter/foundation.dart';
import '../services/url_service.dart';

import '../utils/firebase.dart';

class UrlUtils {
  final Analytics _analytics;
  final UrlService _urlService;

  UrlUtils(this._analytics, this._urlService);

  /// Open a [url] with the default device browser
  /// Works with web
  Future<void> launchWithBrowser(String url) async {
    if (await _urlService.canOpen(url)) {
      await _urlService.open(url);
      await _analytics.analyticsEvent(Analytics.browserEvent, url);
    }
  }

  /// Open a [url] in a WebView (Android) or SafariViewController (iOS)
  /// Works with web
  Future<void> launchWithView(String url) async {
    if (await _urlService.canOpen(url)) {
      await _urlService.open(
        url,
        forceWebView: true,
        forceSafariVC: true,
      );
    }
  }

  /// Make a phone call to the provided [number] using device dial
  /// If web, open [fallbackUrl] in a new browser window
  Future<void> makeCall(String number, String fallbackUrl) async {
    if (kIsWeb) {
      await launchWithBrowser(fallbackUrl);
    }

    final url = 'tel:$number';
    if (await _urlService.canOpen(url)) {
      await _urlService.open(url);
      await _analytics.analyticsEvent(Analytics.callEvent, url);
    }
  }

  /// Send an email to email [address] with [subject] and [content]
  /// Works with web
  Future<void> sendEmail(String address, String subject, String content) async {
    final url = 'mailto:$address?subject=$subject&body=content';
    if (await _urlService.canOpen(url)) {
      await _urlService.open(url);
      // For privacy reasons only record the address via analytics
      await _analytics.analyticsEvent(Analytics.emailEvent, address);
    }
  }
}
