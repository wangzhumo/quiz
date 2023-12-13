import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/identity_type.dart';
import 'package:quiz/modules/model/login_model.dart';
import 'package:quiz/modules/providers/provider.dart';
import 'package:quiz/modules/repositories/login_repository.dart';
import 'package:quiz/modules/router/router_helper.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/modules/store/user/user_provider.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState(
      {@Default(IdentityType.UNKnow) IdentityType identityType,
      required String identity,
      required String credential,
      @Default(false) bool enable}) = _LoginState;
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({required this.loginRepository, required this.userManager})
      : super(LoginState(identity: '', credential: ''));

  final ILoginRespository loginRepository;
  final UserManager userManager;
  void onTabSignIn(BuildContext context) {
    loginRepository
        .signIn(state.identityType, state.identity, state.credential)
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
        RouterHelper().homePage(context);
      }
    });
  }

  void onTapSignUp(BuildContext context) {
    GoRouter.of(context).push(Routes.register);
  }

  void onTapBack(BuildContext context) {
    RouterHelper().homePage(context);
  }

  updateCredential(String credential) {
    LoginState newState = state.copyWith(credential: credential);
    state = updateEnable(newState);
  }

  updateIdentity(String identity) {
    LoginState newState = state.copyWith(identity: identity);
    state = updateEnable(newState);
  }

  bool checkCredential(LoginState newState) {
    return newState.credential.isNotEmpty;
  }

  bool checkIdentity(LoginState newState) {
    if (newState.identity.isEmpty) {
      return false;
    }
    // if (!RegExpUtils.isEmail(value)) {
    //   return false;
    // }
    return true;
  }

  updateEnable(LoginState newState) {
    bool flag = checkCredential(newState) && checkIdentity(newState);
    if (flag != newState.enable) {
      return newState.copyWith(enable: flag);
    }
    return newState;
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  final loginProvider = ref.watch(loginRespositoryProvider);
  final userManager = ref.read(userProvider.notifier);
  return LoginNotifier(
      loginRepository: loginProvider, userManager: userManager);
});
