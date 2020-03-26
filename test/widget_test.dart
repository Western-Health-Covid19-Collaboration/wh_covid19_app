// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:wh_covid19/main.dart';

void main() {
  testWidgets('show WH org name on home page', (tester) async {
    // dont use _initApp as for this we *dont* want the future to complete yet
    await tester.pumpWidget(MyApp());
  });
}
