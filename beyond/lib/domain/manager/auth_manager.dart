import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/shared_preferences_service.dart';

part 'auth_manager.g.dart';

class AuthManager = _AuthManager with _$AuthManager;

abstract class _AuthManager with Store {
  static const loginTokenKey = 'loginToken';

  final ApiService _api;
  final SharedPreferencesService _sharedPreferencesService;

  @observable
  AuthState? authState;

  _AuthManager(this._api, this._sharedPreferencesService);

  @action
  void loadSavedLogin() {
    var token = _sharedPreferencesService.getString(loginTokenKey);
    if (token != null && token.isNotEmpty) {
      _api.token = token;
      authState = AuthState(token);
    } else {
      authState = AuthState();
    }
  }

  @action
  Future<LoginResponse> login(String username, String password) async {
    var authTokenResult = await _api.getAuthToken(username, password);
    var token = authTokenResult.data;
    if (authTokenResult.isSuccess && token != null) {
      authState = AuthState(token);
      await _sharedPreferencesService.setString(loginTokenKey, token);
      return LoginResponse.success();
    } else {
      return LoginResponse.fail(LoginFailure.Invalid);
    }
  }

  @action
  Future logout() async {
    _api.token = null;
    await _sharedPreferencesService.remove(loginTokenKey);
    authState = AuthState();
  }
}

class AuthState extends Equatable {
  late final String? token;
  late final bool isLoggedIn;

  @override
  List<Object?> get props => [token, isLoggedIn];

  AuthState([this.token]) {
    isLoggedIn = token != null;
  }
}

class LoginResponse {
  late bool isSuccess;
  LoginFailure? failure;

  LoginResponse.success() {
    isSuccess = true;
  }

  LoginResponse.fail(LoginFailure fail) {
    isSuccess = false;
    failure = fail;
  }
}

enum LoginFailure { Invalid, Unknown }
