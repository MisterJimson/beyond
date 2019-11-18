import 'package:beyond/infra/service_locator.dart';
import 'package:beyond/infra/view_model_factory.dart';
import 'package:beyond/manager/auth_manager.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/location_service.dart';
import 'package:beyond/service/shared_preferences_service.dart';
import 'package:beyond/ui/navigation_manager.dart';
import 'package:mockito/mockito.dart';

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

    // Basic stubs
    // Api
    when(apiService.getAuthToken(any, any))
        .thenAnswer((_) => Future.value(ApiResponse(200, data: "token")));

    // SharedPreferences
    when(sharedPreferencesService.setString(any, any))
        .thenAnswer((_) => Future.value(true));
  }
}

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

class MockApiService extends Mock implements ApiService {}

class MockLocationService extends Mock implements LocationService {}
