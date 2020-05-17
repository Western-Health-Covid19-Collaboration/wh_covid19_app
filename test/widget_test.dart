import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wh_covid19/constants.dart';
import 'package:wh_covid19/intro_router.dart';
import 'package:wh_covid19/strings.dart';
import 'package:wh_covid19/wh_app.dart';

void main() {
  /// Initial Router Tests
  testWidgets(
    'IntroRouter gets created on app start',
    (tester) async {
      await tester.pumpWidget(const WHApp());
      expect(find.byType(IntroRouter), findsOneWidget);
    },
  );

  /// Disclaimer Tests
  testWidgets(
    'Show Disclaimer as first screen if user has not previously agreed to it',
    (tester) async {
      SharedPreferences.setMockInitialValues(<String, dynamic>{});
      await tester.pumpWidget(const WHApp());
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text(Strings.disclaimerHeading), findsOneWidget);
    },
  );

  testWidgets(
    'Show Disclaimer as first screen if disclaimer current version does not match previously accepted version',
    (tester) async {
      SharedPreferences.setMockInitialValues(<String, dynamic>{
        'flutter.${Constants.settingDisclaimerAgreed}': true,
        'flutter.${Constants.settingDisclaimerVersion}': '-1',
      });
      await tester.pumpWidget(const WHApp());
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text(Strings.disclaimerTitle), findsOneWidget);
    },
  );

  testWidgets(
    'Show Home screen if user has previously accepted disclaimer and version is unchanged',
    (tester) async {
      SharedPreferences.setMockInitialValues(<String, dynamic>{
        'flutter.${Constants.settingDisclaimerAgreed}': true,
        'flutter.${Constants.settingDisclaimerVersion}':
            '${Strings.disclaimerCurrentVersion}',
      });
      await tester.pumpWidget(const WHApp());
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text(Strings.homeHeading1), findsOneWidget);
      expect(find.text(Strings.homeHeading2), findsOneWidget);
    },
  );

  // Move this to integration test one setup for flutter driver
  testWidgets(
    'Show Onboarding screens after disclaimer if this is app first run',
    (tester) async {
      SharedPreferences.setMockInitialValues(<String, dynamic>{});
      await tester.pumpWidget(const WHApp());
      await tester.pumpAndSettle(const Duration(seconds: 3));
      // Get the disclaimer screen
      expect(find.text(Strings.disclaimerHeading), findsOneWidget);
      // Tap the I Agree button
      await tester.tap(find.byType(RaisedButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      // Get the first onboarding screen
      expect(find.text(Strings.onboarding1Title), findsOneWidget);
    },
  );
}
