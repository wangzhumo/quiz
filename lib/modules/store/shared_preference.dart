import 'package:quiz/modules/providers/provider.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'dart:convert';

class SharedPreference {
  static final SharedPreference _singleton = SharedPreference._internal();
  SharedPreference._internal();
  factory SharedPreference() {
    return _singleton;
  }

  static const _userKey = 'user_local_key';
  void saveUser(User user) {
    sharedPreferences.setString(_userKey, jsonEncode(user));
  }

  User? getUser() {
    final jsonData = sharedPreferences.getString(_userKey);
    if (jsonData != null && jsonData.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(jsonData);
      return User.fromJson(map);
    }
    return null;
  }

  void logout() {
    sharedPreferences.setString(_userKey, "");
  }
}
