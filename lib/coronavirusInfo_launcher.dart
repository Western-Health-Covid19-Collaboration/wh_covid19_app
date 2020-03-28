import 'package:url_launcher/url_launcher.dart';

class CoronavirusInfoLauncher {
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

}