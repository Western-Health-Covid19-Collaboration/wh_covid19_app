import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wh_covid19/intro_router.dart';
import 'package:wh_covid19/main.dart';

void main() {
  setUpAll(() {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
  });

  testWidgets('show IntroRouter on app start', (tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(IntroRouter), findsOneWidget);
  });

  testWidgets('show disclaimer if user has not previously accepted it',
      (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Disclaimer and conditions of use'), findsOneWidget);
  });
}
