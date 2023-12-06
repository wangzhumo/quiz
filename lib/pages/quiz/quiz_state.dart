import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/router/routers.dart';

class QuizState {}

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState());

  void onTapItem(BuildContext context,int index) {
    GoRouter.of(context).pushNamed(Routes.quizIntro, extra: index);
  }
}

final quizProvider =
    StateNotifierProvider.autoDispose<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});
