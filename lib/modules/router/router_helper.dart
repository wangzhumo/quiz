import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/router/router_meta.dart';
import 'package:quiz/modules/router/routers.dart';

// helper to jump page
class RouterHelper {
  // Private constructor
  RouterHelper._init();

  // Singleton instance
  static final RouterHelper _instance = RouterHelper._init();

  // Factory constructor to access the instance
  factory RouterHelper() {
    return _instance;
  }

  // home page
  void homePage(BuildContext context) {
    //  如果当前在 / 页面，跳转page即可
    GoRouter.of(context)
        .go(Routes.main, extra: RouterMeta(auth: false, parameter: 0));
  }

  void discoverPage(BuildContext context) {
    GoRouter.of(context)
        .go(Routes.main, extra: RouterMeta(auth: false, parameter: 1));
  }

  void profilePage(BuildContext context) {
    GoRouter.of(context)
        .go(Routes.main, extra: RouterMeta(auth: true, parameter: 2));
  }
}
