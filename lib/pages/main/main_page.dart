import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/utils/screen_util.dart';

class MainPage extends StatelessWidget {
  final Widget child;

  const MainPage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    SA.init(context, width: 375, height: 844, allowSystemFontScale: true);
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey[200],
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
