import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/router/routers.dart';

part 'intro_state.freezed.dart';

@freezed
class IntroState with _$IntroState {
  factory IntroState({
    required String title,
    required String described,
    required String coverUrl,
  }) = _IntroState;
}

class IntroNotifier extends StateNotifier<IntroState> {
  IntroNotifier() : super(IntroState(title: "", described: "", coverUrl: ""));

  void onTapBack(BuildContext context) {
    GoRouter.of(context).pop();
  }
}

final introProvider =
    StateNotifierProvider.autoDispose<IntroNotifier, IntroState>((ref) {
  return IntroNotifier();
});
