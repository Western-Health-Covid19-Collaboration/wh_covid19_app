import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<bool> open(String url, {bool forceWebView, bool forceSafariVC}) =>
      launch(url, forceWebView: forceWebView, forceSafariVC: forceSafariVC);

  Future<bool> canOpen(String url) => canLaunch(url);
}
