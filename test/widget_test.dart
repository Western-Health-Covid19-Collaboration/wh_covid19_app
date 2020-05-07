import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:wh_covid19/appState.dart';
import 'package:wh_covid19/intro_router.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/utils/firebase.dart';
import 'package:wh_covid19/utils/url_utils.dart';
import 'package:wh_covid19/wh_app.dart';

void main() {
  MockPrivacyStateNotifier mockState;
  MockAnalytics mockAnalytics;

  Widget _wrapWithProvider(Widget widget) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PrivacyStateNotifier>(
          create: (_) => mockState,
        ),
        Provider<UrlUtils>.value(value: MockUrlUtils()),
        Provider<Analytics>.value(value: mockAnalytics),
      ],
      child: widget,
    );
  }

  setUp(() {
    mockState = MockPrivacyStateNotifier();
    mockAnalytics = MockAnalytics();

    when(mockAnalytics.observer).thenAnswer((_) => MockObserver());
  });

  /// Initial Router Tests
  testWidgets(
    'IntroRouter gets created on app start',
    (tester) async {
      when(mockState.disclaimerAgreed).thenAnswer((_) => Future.value(false));
      when(mockAnalytics.observer).thenAnswer((_) => MockObserver());

      await tester.pumpWidget(_wrapWithProvider(const WHApp()));
      expect(find.byType(IntroRouter), findsOneWidget);
    },
  );

  /// Disclaimer Tests
  testWidgets(
    'Show Disclaimer if user has not previously accepted it',
    (tester) async {
      final mockObserver = MockObserver();
      when(mockState.disclaimerAgreed).thenAnswer((_) => Future.value(false));
      when(mockAnalytics.observer).thenAnswer((_) => mockObserver);

      String route;

      await tester.pumpWidget(_wrapWithProvider(
        MaterialApp(
            home: IntroRouter(),
            onGenerateRoute: (settings) {
              route = settings.name;
              return MaterialPageRoute<Container>(
                builder: (_) => Container(),
              );
            }),
      ));

      expect(Routes.disclaimer, route);
    },
  );

  testWidgets(
    'Show Home screen if user has previously accepted disclaimer',
    (tester) async {
      final mockObserver = MockObserver();
      when(mockState.disclaimerAgreed).thenAnswer((_) => Future.value(true));
      when(mockAnalytics.observer).thenAnswer((_) => mockObserver);

      String route;

      await tester.pumpWidget(_wrapWithProvider(
        MaterialApp(
            home: IntroRouter(),
            onGenerateRoute: (settings) {
              route = settings.name;
              return MaterialPageRoute<Container>(
                builder: (_) => Container(),
              );
            }),
      ));

      expect(route, Routes.home);
    },
  );
}

class MockUrlUtils extends Mock implements UrlUtils {}

class MockAnalytics extends Mock implements Analytics {}

class MockPrivacyStateNotifier extends Mock implements PrivacyStateNotifier {
  MockPrivacyStateNotifier() {
    when(hasListeners).thenReturn(false);
  }
}

class MockObserver extends Mock implements FirebaseAnalyticsObserver {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
