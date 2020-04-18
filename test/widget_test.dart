import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wh_covid19/constants.dart';
import 'package:wh_covid19/intro_router.dart';
import 'package:wh_covid19/wh_app.dart';
import 'package:wh_covid19/strings.dart';

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
    'Show Disclaimer if user has not previously accepted it',
    (tester) async {
      SharedPreferences.setMockInitialValues(<String, dynamic>{});
      await tester.pumpWidget(const WHApp());
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text(Strings.disclaimerTitle), findsOneWidget);
    },
  );

  testWidgets(
    'Show Disclaimer screen if disclaimer current version does not match previously accepted version',
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
    'Show Home screen if user has previously accepted disclaimer',
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
}
