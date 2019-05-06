import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  Future set(String key, String data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, data);
  }

  Future get(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var str = preferences.getInt(key);
    return str;
  }
}
