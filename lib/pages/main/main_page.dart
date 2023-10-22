import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/modules/store/shared_preference.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/utils/screen_util.dart';

class MainPage extends ConsumerWidget {
  final Widget child;

  const MainPage({required this.child, super.key});
  void bootstrap(UserManager um) {
    // init user.
    User? user = SharedPreference().getUser();
    if (user != null) {
      um.restore(user);
    }
    // show app
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SA.init(context, width: 375, height: 844, allowSystemFontScale: true);
    return AnnotatedRegion(
        value: ref.watch(themeMode.notifier).systemUiOverlay(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: child,
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
            currentIndex: _calculateSelectedIndex(context),
            onTap: (index) => _onItemTaped(index, context),
          ),
        ));
  }

  void _onItemTaped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(Routes.mainTabQuizzes);
        break;
      case 1:
        GoRouter.of(context).go(Routes.mainTabDiscover);
        break;
      case 2:
        GoRouter.of(context).go(Routes.mainTabProfile);
        break;
    }
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.mainTabQuizzes)) {
      return 0;
    }
    if (location.startsWith(Routes.mainTabDiscover)) {
      return 1;
    }
    if (location.startsWith(Routes.mainTabProfile)) {
      return 2;
    }
    return 0;
  }
}
