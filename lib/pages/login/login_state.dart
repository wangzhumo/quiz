import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/identityType.dart';
import 'package:quiz/modules/router/routers.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState(
      {@Default(IdentityType.UNKnow) IdentityType identityType,
      required String? identity,
      required String? credential,
      @Default(false) bool enable}) = _LoginState;
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState(identity: '', credential: ''));

  void onTabSignIn(BuildContext context) {
    GoRouter.of(context).go(Routes.mainTabQuizzes);
  }

  updateCredential(String? credential) {
    LoginState newState = state.copyWith(credential: credential);
    state = updateEnable(newState);
  }

  updateIdentity(String? identity) {
    LoginState newState = state.copyWith(identity: identity);
    state = updateEnable(newState);
  }

  bool checkCredential(LoginState newState) {
    String value = newState.credential ?? '';
    return value.isNotEmpty;
  }

  bool checkIdentity(LoginState newState) {
    String value = newState.identity ?? '';
    if (value.isEmpty) {
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

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});
