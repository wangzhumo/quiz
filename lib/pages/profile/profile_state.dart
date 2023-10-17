import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/http/http.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/modules/store/user/user_provider.dart';

class ProfileState {}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(this.userManager) : super(ProfileState());
  final UserManager userManager;
  void onTagTap() {}

  void onTapLogout(BuildContext context) {
    // 退出登录了.
    userManager.logout();
    // go home page
    GoRouter.of(context).go(Routes.mainTabQuizzes);
    Http.release();
  }

  void onTapVerifyEmail(BuildContext context) {
    // go verify page
    GoRouter.of(context).go(Routes.verfiyCode);
  }
}

final profileProvider = StateNotifierProvider((ref) {
  final userManager = ref.read(userProvider.notifier);
  return ProfileNotifier(userManager);
});
