import 'package:beyond/domain/manager/auth_manager.dart';
import 'package:beyond_helpers/beyond_helpers.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel extends ViewModel with Store {
  final AuthManager _authManager;

  _LoginViewModel(this._authManager);

  @observable
  String username = "";

  @observable
  String password = "";

  @observable
  bool isLoading = false;

  @computed
  bool get isLoginButtonEnabled => username.isNotEmpty && password.isNotEmpty;

  @action
  Future login() async {
    if (isLoading) return;

    isLoading = true;
    var result = await _authManager.login(username, password);

    // So the button doesn't change back as we navigate away
    if (!result.isSuccess) {
      isLoading = false;
    }
  }
}
