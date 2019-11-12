import 'package:beyond/infra/service_locator.dart';
import 'package:beyond/infra/view_model_factory.dart';
import 'package:beyond/manager/auth_manager.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/shared_preferences_service.dart';
import 'package:beyond/ui/navigation_manager.dart';
import 'package:mockito/mockito.dart';

class TestServiceLocator extends ServiceLocator {
  TestServiceLocator() {
    // Mocks
    sharedPreferencesService = MockSharedPreferencesService();

    // Real
    apiService = ApiService();
    authManager = AuthManager(apiService, sharedPreferencesService);
    viewModelFactory = ViewModelFactory(this);
    navigationManager = NavigationManager(viewModelFactory, authManager);
  }
}

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}
