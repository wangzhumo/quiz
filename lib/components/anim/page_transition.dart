import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class PageTransitions {
  static SlideTransition bottomSlide(
      Animation<double> animation, Widget? child) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }

  static routeSlideTransitionPage(Widget child) {
    return CustomTransitionPage(
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return bottomSlide(animation, child);
        });
  }
}
