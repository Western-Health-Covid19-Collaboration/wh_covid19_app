import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wh_covid19/services/url_service.dart';
import 'package:wh_covid19/utils/firebase.dart';
import 'package:wh_covid19/utils/url_utils.dart';

void main() {
  test('url should send analytics', () async {
    final mockAnalytics = MockAnalytics();
    final mockUrlService = MockUrlService();

    when(mockUrlService.canOpen(any)).thenAnswer((_) => Future.value(true));

    final urlUtils = UrlUtils(mockAnalytics, mockUrlService);
    const url = 'http://foo.bar';

    await urlUtils.launchWithBrowser(url);

    verify(mockAnalytics.analyticsEvent(Analytics.browserEvent, url));
  });

  test('email should send analytics', () async {
    final mockAnalytics = MockAnalytics();
    final mockUrlService = MockUrlService();

    when(mockUrlService.canOpen(any)).thenAnswer((_) => Future.value(true));

    final urlUtils = UrlUtils(mockAnalytics, mockUrlService);
    const email = 'mr@foo.com';

    await urlUtils.sendEmail(email, '', '');

    verify(mockAnalytics.analyticsEvent(Analytics.emailEvent, email));
  });

  test('phone call should send analytics', () async {
    final mockAnalytics = MockAnalytics();
    final mockUrlService = MockUrlService();

    when(mockUrlService.canOpen(any)).thenAnswer((_) => Future.value(true));

    final urlUtils = UrlUtils(mockAnalytics, mockUrlService);
    const phone = '0410101010';

    await urlUtils.makeCall(phone, '');

    verify(mockAnalytics.analyticsEvent(Analytics.callEvent, 'tel:$phone'));
  });
}

class MockAnalytics extends Mock implements Analytics {}

class MockUrlService extends Mock implements UrlService {}
