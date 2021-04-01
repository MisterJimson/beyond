import 'package:beyond/service/config/config.dart' as config;

class ConfigService {
  late String locationIqApiKey;

  ConfigService() {
    locationIqApiKey = config.locationIqApiKey;
  }
}
