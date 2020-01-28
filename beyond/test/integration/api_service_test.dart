import 'package:beyond/service/api_service.dart';
import 'package:beyond/service/config/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  // Mock dependencies
  MockConfigService config;
  MockPackageInfoService packageInfo;

  // System under test
  ApiService api;

  // Create our mocks with basic stubs
  // Do this before every test to ensure fresh mocks
  setUp(() {
    config = MockConfigService();
    packageInfo = MockPackageInfoService();

    when(config.locationIqApiKey).thenReturn(locationIqApiKey);
  });

  void createSystemUnderTest() {
    api = ApiService(config, packageInfo);
  }

  test('getPlace returns place', () async {
    // Arrange
    createSystemUnderTest();

    // Act
    var result = await api.getPlace(-79.382074, 43.659554);

    // Assert
    assert(result.isSuccess);
    assert(result.data != null);
    assert(result.data.address.road == 'Yonge St');
  }, skip: true);
}
