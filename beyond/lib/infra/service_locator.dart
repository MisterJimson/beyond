import 'package:beyond/domain/manager/auth_manager.dart';
import 'package:beyond/infra/view_model_factory.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/config/config_service.dart';
import 'package:beyond/service/location_service.dart';
import 'package:beyond/service/package_info_service.dart';
import 'package:beyond/service/shared_preferences_service.dart';
import 'package:beyond/ui/navigation_manager.dart';
import 'package:beyond_helpers/beyond_helpers.dart';
import 'package:flutter/foundation.dart';

class ServiceLocator implements Startable {
  /// Services
  late ConfigService configService;
  late ApiService apiService;
  late SharedPreferencesService sharedPreferencesService;
  late LocationService locationService;
  late PackageInfoService packageInfoService;

  /// UI
  late NavigationManager navigationManager;

  /// Infra
  late ViewModelFactory viewModelFactory;

  /// Global State
  late AuthManager authManager;

  /// Creates a new container for our services and instantiates them
  ServiceLocator() {
    configService = ConfigService();
    packageInfoService = PackageInfoService();
    apiService = ApiService(configService, packageInfoService);
    sharedPreferencesService = SharedPreferencesService();
    locationService = LocationService();
    authManager = AuthManager(apiService, sharedPreferencesService);
    viewModelFactory = ViewModelFactory(this);
    navigationManager = NavigationManager(viewModelFactory, authManager);
  }

  @visibleForTesting
  ServiceLocator.empty();

  /// Runs any required startup code for all our services
  @override
  Future start() async {
    // Order can be important here if the services depend on each other
    return sharedPreferencesService
        .start()
        .then((_) => packageInfoService.start());
  }
}
