// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModel, Store {
  Computed<bool>? _$isLoginButtonEnabledComputed;

  @override
  bool get isLoginButtonEnabled => (_$isLoginButtonEnabledComputed ??=
          Computed<bool>(() => super.isLoginButtonEnabled,
              name: '_LoginViewModel.isLoginButtonEnabled'))
      .value;

  final _$usernameAtom = Atom(name: '_LoginViewModel.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginViewModel.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginViewModel.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginViewModel.login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
isLoading: ${isLoading},
isLoginButtonEnabled: ${isLoginButtonEnabled}
    ''';
  }
}
