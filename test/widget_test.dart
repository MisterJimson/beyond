// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:beyond/infra/service_locator.dart';
import 'package:beyond/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login and see current location', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(MyApp(ServiceLocator()));
      await Future.delayed(Duration(milliseconds: 20));

      expect(find.text("LOGIN"), findsOneWidget);
    });
  });
}
