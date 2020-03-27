import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wh_covid19/intro_router.dart';
import 'package:wh_covid19/main.dart';

void main() {
  testWidgets('show IntroRouter on app start', (tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(IntroRouter), findsOneWidget);
  });

  testWidgets('show disclaimer if user has not previously accepted it',
      (tester) async {
    SharedPreferences.setMockInitialValues(<String, dynamic>{});
    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Disclaimer and conditions of use'), findsOneWidget);
  });

  testWidgets('show homescreen if user has previously accepted disclaimer',
      (tester) async {
    SharedPreferences.setMockInitialValues(
        <String, dynamic>{'flutter.disclaimer_first_view': true});

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Western Health'), findsOneWidget);
  });
}
