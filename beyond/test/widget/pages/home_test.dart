import 'package:beyond/service/api_service.dart';
import 'package:beyond/ui/home/home_page.dart';
import 'package:beyond/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shimmer/shimmer.dart';

import '../../mocks.dart';

// These tests focus on the HomePage and the HomeViewModel

void main() {
  TestServiceLocator serviceLocator;

  Widget homePage;
  HomeViewModel viewModel;

  // Create our ViewModel and mocks with basic stubs
  // Do this before every test to ensure fresh mocks and page/viewmodel
  setUp(() {
    serviceLocator = TestServiceLocator();
  });

  void createSystemUnderTest() {
    viewModel = serviceLocator.viewModelFactory.home();
    homePage = MaterialApp(home: HomePage(viewModel));
  }

  testWidgets('Display current location and nearby parks',
      (WidgetTester tester) async {
    // Arrange
    createSystemUnderTest();

    // Act: Pump page to test
    await tester.pumpWidget(homePage);

    // Assert: Verify UI
    expect(find.text("42 road"), findsOneWidget);
    expect(find.text("POI is 10 meters away"), findsOneWidget);
  });

  testWidgets('Display loading shimmer when loading',
      (WidgetTester tester) async {
    // Arrange: Override mocks to be slower
    when(serviceLocator.apiService.getPointsOfInterest(any, any, any))
        .thenAnswer(
      (_) => Future.delayed(
        Duration(seconds: 1),
        () => ApiResponse(
          200,
          data: [
            PointOfInterest(lat: "42", lon: "42", name: "POI", distance: 10)
          ],
        ),
      ),
    );
    when(serviceLocator.apiService.getPlace(any, any)).thenAnswer(
      (_) => Future.delayed(
        Duration(seconds: 1),
        () => ApiResponse(
          200,
          data: Place(
            lat: "42",
            lon: "42",
            displayName: "Place",
            address: Address(city: "city", road: "road", houseNumber: "42"),
          ),
        ),
      ),
    );
    createSystemUnderTest();

    // Act: Pump page to test
    await tester.pumpWidget(homePage);

    // Assert: Verify UI
    expect(find.byType(Shimmer), findsNWidgets(6));

    // Cleanup: Timers (the delayed futures)
    await tester.pumpAndSettle();
  });
}
