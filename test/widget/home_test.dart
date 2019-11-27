import 'package:beyond/ui/home/home_page.dart';
import 'package:beyond/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

// These tests focus on the HomePage and the HomeViewModel

void main() {
  TestServiceLocator serviceLocator;

  Widget homePage;
  HomeViewModel viewModel;

  // Create our ViewModel and mocks with basic stubs
  // Do this before every test to ensure fresh mocks and page/viewmodel
  setUp(() {
    serviceLocator = TestServiceLocator();
    viewModel = serviceLocator.viewModelFactory.home();
    homePage = MaterialApp(home: HomePage(viewModel));
  });

  testWidgets('Display current location and nearby parks',
      (WidgetTester tester) async {
    // Pump page to test
    await tester.pumpWidget(homePage);

    // Verify UI
    expect(find.text("42 road"), findsOneWidget);
    expect(find.text("POI is 10 meters away"), findsOneWidget);
  });
}
