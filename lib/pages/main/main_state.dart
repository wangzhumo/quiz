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
  final PageController pageController = PageController();

  // child
  final List<Widget> pageList = [
    const QuizzesTab(),
    const DiscoverTab(),
    const ProfileTab(),
  ];

  MainNotifier() : super(MainState());

  void onPageChanged(int index) {
    MainState newState = MainState();
    newState.currentPageIndex = index;
    state = newState;
  }

// routes: [
// GoRoute(
// path: Routes.mainTabQuizzes,
// builder: (context, state) => const QuizzesTab(),
// ),
// GoRoute(
// path: Routes.mainTabDiscover,
// builder: (context, state) {
// return const DiscoverTab();
// }),
// GoRoute(
// path: Routes.mainTabProfile,
// builder: (context, state) {
// return const ProfileTab();
// },
// redirect: (context, state) {
// ProviderContainer container = ProviderScope.containerOf(context);
// bool loginState = container.read(userProvider).hasLogin();
// if (!loginState) {
// return Routes.login;
// }
// return null;
// },
// ),
// ])
}

final mainProvider =
    StateNotifierProvider.autoDispose<MainNotifier, MainState>((ref) {
  return MainNotifier();
});
