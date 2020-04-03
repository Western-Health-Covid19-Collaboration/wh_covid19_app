import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wh_covid19/intro_router.dart';
import 'package:wh_covid19/main.dart';
import 'package:wh_covid19/strings.dart';

void main() {
  testWidgets('IntroRouter gets created on app start', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(IntroRouter), findsOneWidget);
  });

  testWidgets('Show disclaimer if user has not previously accepted it', (tester) async {
    SharedPreferences.setMockInitialValues(<String, dynamic>{});
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text(Strings.disclaimerTitle), findsOneWidget);
  });

  // TODO - Issue here running > 1 SharedPReferences tests as more tests than just this need to be added
//  testWidgets('Show home screen if user has previously accepted disclaimer', (tester) async {
//    SharedPreferences.setMockInitialValues(<String, dynamic>{'flutter.disclaimer_agreed': true});
//    SharedPreferences.setMockInitialValues(<String, dynamic>{'flutter.disclaimer_version': '1'});
//    await tester.pumpWidget(const MyApp());
//    await tester.pumpAndSettle(const Duration(seconds: 3));
//    expect(find.text('Look After Yourself'), findsOneWidget);
//    expect(find.text('Airway'), findsOneWidget);
//  });
}
