import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreference {
  static final SharedPreference _singleton = SharedPreference._internal();
  SharedPreference._internal();
  factory SharedPreference() {
    return _singleton;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static const _userKey = 'user_local_key';
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_userKey, jsonEncode(user));
  }

  Future<User?> getUser() async {
    final SharedPreferences prefs = await _prefs;
    final jsonData = prefs.getString(_userKey);
    if (jsonData != null) {
      Map<String, dynamic> map = jsonDecode(jsonData);
      return User.fromJson(map);
    }
    return null;
  }
}
