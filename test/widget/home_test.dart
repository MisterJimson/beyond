import 'package:beyond/ui/home/home_page.dart';
import 'package:beyond/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  TestServiceLocator serviceLocator;

  HomeViewModel viewModel;

  // Create our ViewModel and mocks with basic stubs
  // Do this before every test to ensure fresh mocks
  setUp(() {
    serviceLocator = TestServiceLocator();
    viewModel = serviceLocator.viewModelFactory.home();
  });

  testWidgets('test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage(viewModel)));
  });
}
