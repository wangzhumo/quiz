part of 'routers.dart';

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
        redirect: quizRedirect,
        routes: [
          GoRoute(
            name: Routes.quizIntro,
            path: Routes.quizIntro,
            pageBuilder: (context, GoRouterState state) {
              RouterMeta meta = state.extra.asMeta();
              Logger.instance.debug(state);
              return CustomTransitionPage(
                  child: IntroPage(meta.asInt(defaultValue: 0)),
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
            pageBuilder: (context, state) =>
                PageTransitions.routeSlideTransitionPage(
                    const QuizzesSearchPage()),
          ),
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

String? quizRedirect(BuildContext context, GoRouterState state) {
  RouterMeta meta = state.extra.asMeta();
  if (meta.auth) {
    // check login state
    ProviderContainer container = ProviderScope.containerOf(context);
    bool loginState = container.read(userProvider).hasLogin();
    if (!loginState) {
      return Routes.login;
    }
  }
  return null;
}
