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
    GoRoute(path: Routes.login, builder: (context, state) => const LoginPage())
  ],
  initialLocation: Routes.mainTabQuizzes,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const GlobalErrorPage(),
);
