import 'package:beyond/domain/manager/auth_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

// These unit tests only test the AuthManager.

void main() {
  // Mock dependencies
  MockApiService api;
  MockSharedPreferencesService sharedPreferences;

  // System under test
  AuthManager auth;

  // Create our SUT and mocks with basic stubs
  // Do this before every test to ensure fresh mocks and SUT
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

  // Other than the basic stubs, we stub for a specific test as well
  // This stub is removed at the end of the test as we recreate mocks in setUp
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
