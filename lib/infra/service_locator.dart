import 'package:beyond/infra/view_model_factory.dart';
import 'package:beyond/manager/auth_manager.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/service_common.dart';
import 'package:beyond/service/shared_preferences_service.dart';
import 'package:beyond/ui/navigation_manager.dart';

class ServiceLocator implements Startable {
  /// Services
  ApiService apiService;
  SharedPreferencesService sharedPreferencesService;

  /// UI
  NavigationManager navigationManager;

  /// Infra
  ViewModelFactory viewModelFactory;

  /// Global State
  AuthManager authManager;

  ServiceLocator() {
    apiService = ApiService();
    sharedPreferencesService = SharedPreferencesService();
    authManager = AuthManager(apiService, sharedPreferencesService);
    viewModelFactory = ViewModelFactory(this);
    navigationManager = NavigationManager(viewModelFactory, authManager);
  }

  @override
  Future start() async {
    // Order can be important here if the services depend on each other
    return sharedPreferencesService.start();
  }
}
