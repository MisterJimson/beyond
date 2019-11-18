import 'package:beyond/main.dart';
import 'package:beyond/ui/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

void main() {
  TestServiceLocator serviceLocator;
  setUpAll(() {
    serviceLocator = TestServiceLocator();
  });

  testWidgets('start app and login', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(serviceLocator));
    await tester.pumpAndSettle();

    // Verify login page is showing with button
    expect(find.text("LOGIN"), findsOneWidget);

    // Login
    await tester.enterText(find.byKey(Key("emailField")), "email");
    await tester.enterText(find.byKey(Key("passwordField")), "password");
    await tester.pumpAndSettle();
    await tester.tap(find.text("LOGIN"));

    // Verify HomePage is showing
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
  });
}
