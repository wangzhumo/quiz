import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/identityType.dart';
import 'package:quiz/modules/providers/provider.dart';
import 'package:quiz/modules/repositories/login_repository.dart';
import 'package:quiz/modules/router/routers.dart';

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
  RegisterNotifier({required this.loginRepository})
      : super(RegisterState(identity: '', credential: '', nick: ''));

  final ILoginRespository loginRepository;
  void onTabSignIn(BuildContext context) {
    loginRepository
        .signUp(
            IdentityType.Email, state.identity, state.credential, state.nick)
        .then((value) => {
              if (value.isSuccessful())
                {GoRouter.of(context).go(Routes.mainTabQuizzes)}
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
  return RegisterNotifier(loginRepository: loginProvider);
});
