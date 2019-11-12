import 'dart:convert';
import 'package:beyond/service/service_common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements Startable {
  SharedPreferences prefs;

  @override
  Future start() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  String getString(String key) {
    return prefs.getString(key);
  }

  Future<bool> setJson(String key, dynamic json) {
    return prefs.setString(key, jsonEncode(json));
  }

  dynamic getJson(String key) {
    var data = prefs.getString(key);
    if (data == null || data.isEmpty) return null;
    return jsonDecode(data);
  }
}
