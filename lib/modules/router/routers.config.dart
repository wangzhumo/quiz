part of 'routers.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_main');

final routers = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainPage(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
              path: Routes.mainTabQuizzes,
              builder: (context, state) {
                return const QuizzesTab();
              }),
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
    )
  ],
  initialLocation: Routes.mainTabQuizzes,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const GlobalErrorPage(),
);
