import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/copyable.dart';
import 'package:quiz/modules/identityType.dart';
import 'package:quiz/modules/router/routers.dart';

@freezed
class LoginState implements CopyWith<LoginState> {
  IdentityType identityType = IdentityType.UNKnow;
  String? identity;
  String? credential;
  bool enable = false;
  LoginState({
    required this.identityType,
    required this.identity,
    required this.credential,
  });
  LoginState.initial()
      : identity = '',
        enable = false,
        identityType = IdentityType.UNKnow,
        credential = '';

  bool checkCredential() {
    String value = credential ?? '';
    return value.isNotEmpty;
  }

  bool checkIdentity() {
    String value = identity ?? '';
    if (value.isEmpty) {
      return false;
    }
    // if (!RegExpUtils.isEmail(value)) {
    //   return false;
    // }
    return true;
  }

  @override
  LoginState copyWith({
    IdentityType? identityType,
    String? identity,
    String? credential,
  }) {
    return LoginState(
      identity: identity ?? this.identity,
      credential: credential ?? this.credential,
      identityType: identityType ?? this.identityType,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState.initial());

  void onTabSignIn(BuildContext context) {
    GoRouter.of(context).go(Routes.mainTabQuizzes);
  }

  updateCredential(String? credential) {
    LoginState newState = state.copyWith(credential: credential);
    updateEnable(newState);
    state = newState;
  }

  updateIdentity(String? identity) {
    LoginState newState = state.copyWith(identity: identity);
    updateEnable(newState);
    state = newState;
  }

  updateEnable(LoginState newState) {
    bool flag = newState.checkCredential() && newState.checkIdentity();
    if (flag != newState.enable) {
      newState.enable = flag;
    }
    return newState;
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});
