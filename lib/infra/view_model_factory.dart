import 'package:beyond/infra/service_locator.dart';
import 'package:beyond/ui/home/home_view_model.dart';
import 'package:beyond/ui/login/login_view_model.dart';

class ViewModelFactory {
  final ServiceLocator _locator;

  ViewModelFactory(this._locator);

  LoginViewModel get login => LoginViewModel(_locator.authManager);
  HomeViewModel get home => HomeViewModel(
      _locator.authManager, _locator.apiService, _locator.locationService);
}
