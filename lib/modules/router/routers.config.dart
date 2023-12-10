part of 'routers.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_main');

final routers = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const LoginPage(),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child);
        },
      ),
      routes: [
        GoRoute(
            path: Routes.registerSubPath,
            builder: (context, state) => const RegisterPage())
      ],
    ),
    GoRoute(
        path: Routes.main,
        builder: (context, state) => const MainPage(),
        routes: [
          GoRoute(
            name: Routes.quizIntro,
            path: Routes.quizIntro,
            pageBuilder: (context,GoRouterState state) {
              int index = (state.extra ?? 0) as int;
              Logger.instance.debug(state);
              return CustomTransitionPage(
                  child: IntroPage(index),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  });
            },
          ),
          GoRoute(
              path: Routes.quizAdvance,
              name: Routes.quizAdvance,
              builder: (context, GoRouterState state) {
                return const QuizzesAdvancePage();
              }),
          GoRoute(
              path: Routes.quizSearch,
              name: Routes.quizSearch,
              builder: (context, GoRouterState state) {
                return const QuizzesSearchPage();
              })
        ]),
    GoRoute(
        path: Routes.verfiyCode,
        builder: (context, GoRouterState state) {
          String type = state.pathParameters['type'] ?? 'email';
          return VerifyPage(type);
        }),
  ],
  initialLocation: Routes.main,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const GlobalErrorPage(),
);
