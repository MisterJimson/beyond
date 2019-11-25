import 'package:beyond/domain/manager/auth_manager.dart';
import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  // Mock dependencies
  ApiService api;
  SharedPreferencesService sharedPreferences;

  // System under test
  AuthManager auth;

  setUp(() {
    api = MockApiService();
    sharedPreferences = MockSharedPreferencesService();

    setupApiStubs(api);
    setupSharedPreferencesStubs(sharedPreferences);

    auth = AuthManager(api, sharedPreferences);
  });

  test('AuthState starts null', () async {
    // Assert
    assert(auth.authState == null);
  });

  test('loadSavedLogin with saved login results in logged in AuthState',
      () async {
    // Arrange
    when(sharedPreferences.getString("loginToken")).thenReturn("token");

    // Act
    auth.loadSavedLogin();

    // Assert
    assert(auth.authState != null);
    assert(auth.authState.isLoggedIn);
    assert(auth.authState.token == "token");
  });

  test('loadSavedLogin with no saved login results in logged out AuthState',
      () async {
    // Act
    auth.loadSavedLogin();

    // Assert
    assert(auth.authState != null);
    assert(!auth.authState.isLoggedIn);
    assert(auth.authState.token == null);
  });
}
