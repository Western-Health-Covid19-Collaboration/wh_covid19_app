import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLauncher {
  /// Open a [url] with the default device browser
  /// Works with web
  static Future<void> launchWithBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  /// Open a [url] in a WebView (Android) or SafariViewController (iOS)
  /// Works with web
  static Future<void> launchWithView(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: true,
      );
    }
  }

  /// Make a phone call to the provided [number] using device dial
  /// If web, open [fallbackUrl] in a new browser window
  static Future<void> makeCall(String number, String fallbackUrl) async {
    if (kIsWeb) {
      await launchWithBrowser(fallbackUrl);
    }

    final url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  /// Send an email to email [address] with [subject] and [content]
  /// Works with web
  static Future<void> sendEmail(
      String address, String subject, String content) async {
    final url = 'mailto:$address?subject=$subject&body=content';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
