import 'package:quiz/modules/http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/modules/copyable.dart';
import 'package:quiz/modules/store/shared_preference.dart';

class User implements Copyable {
  String uid;
  String nick = '';
  String avatar = '';
  int status = 0;
  String region = "Global";
  String token = '';
  int identityType = 0;
  String identity = '';
  int lastAt = 0;

  User(
      {this.uid = '',
      this.nick = '',
      this.avatar = '',
      this.status = 0,
      this.region = "Global",
      this.token = '',
      this.identityType = 0,
      this.identity = '',
      this.lastAt = 0});

  bool hasLogin() => uid.isNotEmpty && token.isNotEmpty;

  @override
  User copy() {
    return User()
      ..uid = uid
      ..nick = nick
      ..avatar = avatar
      ..status = status
      ..region = region
      ..token = token
      ..identityType = identityType
      ..identity = identity
      ..lastAt = lastAt;
  }

  @override
  User copyWith(
      {String? uid,
      String? nick,
      String? avatar,
      int? status,
      String? region,
      String? token,
      int? identityType,
      String? identity,
      int? lastAt}) {
    User newUser = User();
    newUser.uid = avatar ?? this.uid;
    newUser.nick = nick ?? this.nick;
    newUser.avatar = avatar ?? this.avatar;
    newUser.status = status ?? this.status;
    newUser.region = region ?? this.region;
    newUser.token = token ?? this.token;
    newUser.identityType = identityType ?? this.identityType;
    newUser.identity = identity ?? this.identity;
    newUser.lastAt = lastAt ?? this.lastAt;
    return newUser;
  }

  static User fromJson(Map<String, dynamic> json) {
    User user = User();
    if (json["uid"] is String) {
      user.uid = json["uid"];
    }
    if (json["avatar"] is String) {
      user.avatar = json["avatar"];
    }
    if (json["nick"] is String) {
      user.nick = json["nick"];
    }
    if (json["status"] is int) {
      user.status = json["status"];
    }
    if (json["region"] is String) {
      user.region = json["region"];
    }
    if (json["token"] is String) {
      user.token = json["token"];
    }
    if (json["lastAt"] is int) {
      user.lastAt = json["lastAt"];
    }
    if (json["identityType"] is int) {
      user.identityType = json["identityType"];
    }
    if (json["identity"] is String) {
      user.identity = json["identity"];
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uid"] = uid;
    _data["avatar"] = avatar;
    _data["nick"] = nick;
    _data["status"] = status;
    _data["region"] = region;
    _data["lastAt"] = lastAt;
    _data["token"] = token;
    _data["identityType"] = identityType;
    _data["identity"] = identity;
    return _data;
  }
}

class UserManager extends StateNotifier<User> {
  UserManager(this.preference) : super(User()) {
    User? user = preference.getUser();
    restore(user);
  }
  final SharedPreference preference;
  // restore
  void restore(User? user) {
    if (user != null) {
      state = user;
      // update http token
      Http.updateToken(user.token);
    }
  }

  // save login user
  User login(User user) {
    // update http token
    Http.updateToken(user.token);
    // save to state
    state = user;
    // save to local
    _saveToLocal(user);
    return state;
  }

  // save to local store
  _saveToLocal(user) async {
    SharedPreference().saveUser(user);
  }

  // logout
  User logout() {
    // update http token
    Http.updateToken('');
    // reset
    state = User();
    // clear user
    preference.logout();
    return state;
  }
}

final userProvider = StateNotifierProvider<UserManager, User>((_) {
  return UserManager(SharedPreference());
});
