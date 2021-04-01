// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthManager on _AuthManager, Store {
  final _$authStateAtom = Atom(name: '_AuthManager.authState');

  @override
  AuthState? get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState? value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthManager.login');

  @override
  Future<LoginResponse> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  final _$logoutAsyncAction = AsyncAction('_AuthManager.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AuthManagerActionController = ActionController(name: '_AuthManager');

  @override
  void loadSavedLogin() {
    final _$actionInfo = _$_AuthManagerActionController.startAction(
        name: '_AuthManager.loadSavedLogin');
    try {
      return super.loadSavedLogin();
    } finally {
      _$_AuthManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authState: ${authState}
    ''';
  }
}
