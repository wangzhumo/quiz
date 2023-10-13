import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/identityType.dart';
import 'package:quiz/modules/providers/provider.dart';
import 'package:quiz/modules/repository/login_repository.dart';
import 'package:quiz/modules/router/routers.dart';

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
  LoginNotifier({required this.loginRepository})
      : super(LoginState(identity: '', credential: ''));

  final ILoginRespository loginRepository;
  void onTabSignIn(BuildContext context) {
    loginRepository
        .signIn(state.identityType, state.identity, state.credential)
        .then((value) => {
              if (value.isSuccessful())
                {GoRouter.of(context).go(Routes.mainTabQuizzes)}
            });
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
  return LoginNotifier(loginRepository: loginProvider);
});
