import 'package:beyond/service/config/config.dart' as config;

class ConfigService {
  String locationIqApiKey;

  ConfigService() {
    locationIqApiKey = config.locationIqApiKey;
  }
}
