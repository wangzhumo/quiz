import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/router/routers.dart';

class QuizAdvanceState {}

class QuizAdvanceNotifier extends StateNotifier<QuizAdvanceState> {
  QuizAdvanceNotifier() : super(QuizAdvanceState());

  void onBackTap(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSearchTap(BuildContext context) {
    GoRouter.of(context).replaceNamed(Routes.quizSearch);
  }
}

final quizAdvanceProvider =
    StateNotifierProvider.autoDispose<QuizAdvanceNotifier, QuizAdvanceState>((ref) {
  return QuizAdvanceNotifier();
});
