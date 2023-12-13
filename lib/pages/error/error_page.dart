import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/router/router_helper.dart';
import 'package:quiz/modules/router/routers.dart';

class GlobalErrorPage extends StatelessWidget {
  const GlobalErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return SafeArea(
        child: Scaffold(
      body: Center(
        widthFactor: double.infinity,
        heightFactor: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              if (router.canPop()) {
                router.pop();
              } else {
                RouterHelper().homePage(context);
              }
            },
            child: const Text('Error Page')),
      ),
    ));
  }
}
