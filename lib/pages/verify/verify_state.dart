import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:quiz/utils/log/logger.dart';

part 'verify_state.freezed.dart';

@freezed
class VerifyState with _$VerifyState {
  factory VerifyState(
      {@Default(0) int status,
      @Default('') String code,
      String? codeKey,
      required String identity}) = _LoginState;
}

class VerifyNotifier extends StateNotifier<VerifyState> {
  final TextEditingController controller = TextEditingController();
  final UserManager userManager;
  Timer? _timer;
  VerifyNotifier(this.userManager)
      : super(VerifyState(identity: userManager.state.identity)) {
    Logger().info(userManager.state.identity);
    controller.text = userManager.state.identity;
  }

  void updateCode(String code) {
    state = state.copyWith(code: code);
  }

  void _timerCallback(Timer timer) {
    if (state.status < 1) {
      timer.cancel();
      state = state.copyWith(status: 0);
    } else {
      state = state.copyWith(status: (state.status - 1));
    }
  }

  void sendVerifyCode() {
    _timer?.cancel();
    state = state.copyWith(status: 60);
    _timer = Timer.periodic(const Duration(seconds: 1), _timerCallback);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  bool hasComplete() {
    return state.code.length == 4;
  }

  void onTapVerify(context) {
    // request http to verify
    // jump
    GoRouter.of(context).go(Routes.mainTabQuizzes);
  }
}

final verifyProvider =
    StateNotifierProvider<VerifyNotifier, VerifyState>((ref) {
  final userManager = ref.read(userProvider.notifier);
  return VerifyNotifier(userManager);
});
