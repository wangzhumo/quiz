part of 'routers.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_main');

final routers = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          return CustomTransitionPage(
              child: MainPage(child: child),
              transitionDuration: const Duration(milliseconds: 2000),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                final tween =
                    Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.mainTabQuizzes,
            builder: (context, state) => const QuizzesTab(),
          ),
          GoRoute(
              path: Routes.mainTabDiscover,
              builder: (context, state) {
                return const DiscoverTab();
              }),
          GoRoute(
            path: Routes.mainTabProfile,
            builder: (context, state) {
              return const ProfileTab();
            },
            redirect: (context, state) {
              ProviderContainer container = ProviderScope.containerOf(context);
              bool loginState = container.read(userProvider).hasLogin();
              if (!loginState) {
                return Routes.login;
              }
              return null;
            },
          ),
        ]),
    GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
              path: Routes.registerSubPath,
              builder: (context, state) => const RegisterPage())
        ]),
    GoRoute(
      path: Routes.verfiyCode,
      builder: (context, GoRouterState state) {
        String type = state.pathParameters['type'] ?? 'email';
        return VerifyPage(type);
      },
    ),
    GoRoute(
      path: Routes.quizIntro,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            child: const IntroPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            });
      },
    )
  ],
  initialLocation: Routes.mainTabQuizzes,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const GlobalErrorPage(),
);
