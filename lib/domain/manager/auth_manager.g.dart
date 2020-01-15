// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthManager on _AuthManager, Store {
  final _$authStateAtom = Atom(name: '_AuthManager.authState');

  @override
  AuthState get authState {
    _$authStateAtom.context.enforceReadPolicy(_$authStateAtom);
    _$authStateAtom.reportObserved();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.context.conditionallyRunInAction(() {
      super.authState = value;
      _$authStateAtom.reportChanged();
    }, _$authStateAtom, name: '${_$authStateAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<LoginResponse> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AuthManagerActionController = ActionController(name: '_AuthManager');

  @override
  void loadSavedLogin() {
    final _$actionInfo = _$_AuthManagerActionController.startAction();
    try {
      return super.loadSavedLogin();
    } finally {
      _$_AuthManagerActionController.endAction(_$actionInfo);
    }
  }
}
