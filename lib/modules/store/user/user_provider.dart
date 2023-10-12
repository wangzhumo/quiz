import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    StateNotifierProvider<UserManager, User>((_) => UserManager());

class User {
  String uid;
  String nick = '';
  String avatar = '';
  int status = 0;
  String region = "Global";
  String token = '';

  User({
    this.uid = '',
    String nick = '',
    String avatar = '',
    int status = 0,
    String region = "Global",
    String token = '',
  });

  bool hasLogin() => uid.isNotEmpty && token.isNotEmpty;
}

class UserManager extends StateNotifier<User> {
  UserManager() : super(User());
}
