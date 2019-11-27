import 'package:beyond/domain/manager/auth_manager.dart';
import 'package:beyond/infra/service_locator.dart';
import 'package:beyond/infra/view_model_factory.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/location_service.dart';
import 'package:beyond/service/shared_preferences_service.dart';
import 'package:beyond/ui/navigation_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

// This file contains our TestServiceLocator, our Mock classes
// and some basic stubs that are useful for most tests.

// By default the TestServiceLocator uses mocks for Services and
// real implementations for Managers.

// Services need to be mocked as they are fully outside of the app's control.

// Our Widget tests act as integration tests, testing UI, ViewModels, and Managers.
// When needed Managers can also be mocked for specific tests.

class TestServiceLocator extends ServiceLocator {
  TestServiceLocator() : super.empty() {
    // Mocks
    sharedPreferencesService = MockSharedPreferencesService();
    apiService = MockApiService();
    locationService = MockLocationService();

    // Real
    authManager = AuthManager(apiService, sharedPreferencesService);
    viewModelFactory = ViewModelFactory(this);
    navigationManager = NavigationManager(viewModelFactory, authManager);

    // Basic stubbing useful for many tests
    // Can be overridden in specific tests as needed
    setupApiStubs(apiService);
    setupSharedPreferencesStubs(sharedPreferencesService);
    setupLocationStubs(locationService);
  }
}

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

class MockApiService extends Mock implements ApiService {}

class MockLocationService extends Mock implements LocationService {}

void setupApiStubs(ApiService api) {
  when(api.getAuthToken(any, any))
      .thenAnswer((_) => Future.value(ApiResponse(200, data: "token")));
  when(api.getPlace(any, any)).thenAnswer(
    (_) => Future.value(
      ApiResponse(
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
  when(api.getPointsOfInterest(any, any, any)).thenAnswer(
    (_) => Future.value(
      ApiResponse(
        200,
        data: [
          PointOfInterest(lat: "42", lon: "42", name: "POI", distance: 10)
        ],
      ),
    ),
  );
}

void setupSharedPreferencesStubs(SharedPreferencesService sharedPreferences) {
  when(sharedPreferences.setString(any, any))
      .thenAnswer((_) => Future.value(true));
}

void setupLocationStubs(LocationService locationService) {
  when(locationService.getCurrentPosition(
          locationPermissionLevel: anyNamed("locationPermissionLevel"),
          desiredAccuracy: anyNamed("desiredAccuracy")))
      .thenAnswer((_) => Future.value(Position(latitude: 42, longitude: 42)));
}
