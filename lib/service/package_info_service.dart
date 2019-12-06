import 'package:beyond/service/service_common.dart';
import 'package:package_info/package_info.dart';

class PackageInfoService implements Startable {
  PackageInfo packageInfo;

  @override
  Future start() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  String get version => packageInfo.version;

  String get buildNumber => packageInfo.buildNumber;
}
