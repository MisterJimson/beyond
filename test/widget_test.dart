import 'package:beyond/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks.dart';

void main() {
  TestServiceLocator serviceLocator;
  setUpAll(() {
    serviceLocator = TestServiceLocator();
  });

  testWidgets('Login and see current location', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(MyApp(serviceLocator));
      await tester.pumpAndSettle();
      expect(find.text("LOGIN"), findsOneWidget);
    });
  });
}
