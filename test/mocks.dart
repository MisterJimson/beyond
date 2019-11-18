import 'package:beyond/infra/service_locator.dart';
import 'package:beyond/infra/view_model_factory.dart';
import 'package:beyond/manager/auth_manager.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/shared_preferences_service.dart';
import 'package:beyond/ui/navigation_manager.dart';
import 'package:mockito/mockito.dart';

class TestServiceLocator extends ServiceLocator {
  TestServiceLocator() : super.empty() {
    // Mocks
    sharedPreferencesService = MockSharedPreferencesService();
    apiService = MockApiService();

    // Real
    authManager = AuthManager(apiService, sharedPreferencesService);
    viewModelFactory = ViewModelFactory(this);
    navigationManager = NavigationManager(viewModelFactory, authManager);

    when(apiService.getAuthToken(any, any))
        .thenAnswer((_) => Future.value(ApiResponse(200, data: "token")));
  }
}

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

class MockApiService extends Mock implements ApiService {}
