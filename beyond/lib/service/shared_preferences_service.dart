import 'package:beyond_helpers/beyond_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements Startable {
  late SharedPreferences prefs;

  @override
  Future start() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  String? getString(String key) {
    return prefs.getString(key);
  }

  Future<bool> remove(String key) {
    return prefs.remove(key);
  }
}
