import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/identity_type.dart';
import 'package:quiz/modules/model/login_model.dart';
import 'package:quiz/modules/providers/provider.dart';
import 'package:quiz/modules/repositories/login_repository.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/modules/store/user/user_provider.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState(
      {required String identity,
      required String credential,
      required String nick,
      @Default(false) bool enable}) = _RegisterState;
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({required this.loginRepository, required this.userManager})
      : super(RegisterState(identity: '', credential: '', nick: ''));

  final ILoginRespository loginRepository;
  final UserManager userManager;
  void onTabSignIn(BuildContext context) {
    loginRepository
        .signUp(
            IdentityType.Email, state.identity, state.credential, state.nick)
        .then((value) {
      UserModel? userModel = value.data;
      if (value.isSuccessful() && userModel != null) {
        UserModel um = userModel;
        userManager.login(User(
            uid: um.uid,
            avatar: um.avatar,
            nick: um.nick,
            status: um.status,
            token: um.access_token,
            region: um.region,
            identity: um.identity,
            identityType: um.identityType.index,
            lastAt: um.lastAt));
        GoRouter.of(context).go(Routes.mainTabQuizzes);
      }
    });
  }

  void onTapBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  updateCredential(String credential) {
    RegisterState newState = state.copyWith(credential: credential);
    state = updateEnable(newState);
  }

  updateNick(String nick) {
    RegisterState newState = state.copyWith(nick: nick);
    state = updateEnable(newState);
  }

  updateIdentity(String identity) {
    RegisterState newState = state.copyWith(identity: identity);
    state = updateEnable(newState);
  }

  bool checkCredential(RegisterState newState) {
    return newState.credential.isNotEmpty;
  }

  bool checkNick(RegisterState newState) {
    return newState.nick.isNotEmpty;
  }

  bool checkIdentity(RegisterState newState) {
    if (newState.identity.isEmpty) {
      return false;
    }
    // if (!RegExpUtils.isEmail(value)) {
    //   return false;
    // }
    return true;
  }

  updateEnable(RegisterState newState) {
    bool flag = checkCredential(newState) &&
        checkIdentity(newState) &&
        checkNick(newState);
    if (flag != newState.enable) {
      return newState.copyWith(enable: flag);
    }
    return newState;
  }
}

final registerProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>((ref) {
  final loginProvider = ref.watch(loginRespositoryProvider);
  final userManager = ref.read(userProvider.notifier);
  return RegisterNotifier(
      loginRepository: loginProvider, userManager: userManager);
});
