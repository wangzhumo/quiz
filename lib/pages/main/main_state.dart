import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/pages/discover/discover_page.dart';
import 'package:quiz/pages/profile/profile_page.dart';
import 'package:quiz/pages/quiz/quiz_page.dart';

class MainState {
  // page info
  int currentPageIndex = 0;
}

class MainNotifier extends StateNotifier<MainState> {
  final PageController pageController = PageController(keepPage: true);

  // child
  final List<Widget> pageList = [
    const QuizzesTab(),
    const DiscoverTab(),
    const ProfileTab(),
  ];

  MainNotifier() : super(MainState());

  void onControllerInit(int initialPage) {
    MainState newState = MainState();
    newState.currentPageIndex = initialPage;
    state = newState;
  }

  void onPageChanged(int index) {
    MainState newState = MainState();
    newState.currentPageIndex = index;
    state = newState;
  }
}

final mainProvider =
    StateNotifierProvider.autoDispose<MainNotifier, MainState>((ref) {
  return MainNotifier();
});
