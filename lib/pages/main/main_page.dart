import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/store/shared_preference.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/utils/screen_util.dart';

import 'main_state.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  void bootstrap(WidgetRef ref) {
    // init user.
    User? user = SharedPreference().getUser();
    if (user != null) {
      ref.read(userProvider.notifier).restore(user);
    }
    // show app
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SA.init(context, width: 375, height: 844, allowSystemFontScale: true);
    bootstrap(ref);
    return AnnotatedRegion(
        value: ref.watch(themeMode.notifier).systemUiOverlay(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            physics: const ClampingScrollPhysics(),
            controller: ref.read(mainProvider.notifier).pageController,
            children: ref.read(mainProvider.notifier).pageList,
            onPageChanged: (index) => _onItemTaped(index, ref),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).custom.backgroundColor,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey[600],
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.quiz_outlined),
                  label: L.of(context).tab_quizzes),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.find_replace),
                  label: L.of(context).tab_discover),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person_outlined),
                  label: L.of(context).tab_profile)
            ],
            currentIndex: ref.watch(mainProvider).currentPageIndex,
            onTap: (index) => {
              ref.read(mainProvider.notifier).pageController.jumpToPage(index),
              _onItemTaped(index, ref)
            },
          ),
        ));
  }

  void _onItemTaped(int index, WidgetRef ref) {
    ref.read(mainProvider.notifier).onPageChanged(index);
  }
}
