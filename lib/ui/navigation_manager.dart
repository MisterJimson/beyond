import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:beyond/infra/view_model_factory.dart';
import 'package:beyond/manager/auth_manager.dart';
import 'package:beyond/ui/home/home_page.dart';
import 'package:beyond/ui/login/login_page.dart';

class NavigationManager extends NavigatorObserver {
  GlobalKey<NavigatorState> navigatorKey;
  final ViewModelFactory _viewModelFactory;
  final AuthManager _authManager;

  NavigationManager(this._viewModelFactory, this._authManager) {
    navigatorKey = GlobalKey<NavigatorState>();
    reaction((_) => _authManager.authState, _handleAuthUpdate);
  }

  Future resetToLogin() {
    return _setRoot(LoginPage(_viewModelFactory.login));
  }

  Future resetToHome() {
    return _setRoot(HomePage(_viewModelFactory.home));
  }

  void pop<T>([T data]) {
    navigatorKey.currentState.pop<T>(data);
  }

  Future _setRoot(Widget page) {
    return navigatorKey.currentState.pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) => page,
            settings: RouteSettings(name: page.runtimeType.toString())),
        (Route<dynamic> route) => false);
  }

  Future<T> _push<T>(Widget page, {bool fullscreenDialog = false}) async {
    return navigatorKey.currentState.push(MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: page.runtimeType.toString())));
  }

  void _handleAuthUpdate(AuthState authState) {
    authState.isLoggedIn ? resetToHome() : resetToLogin();
  }
}
