import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jazzicon/jazzicon.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:quiz/pages/profile/profile_state.dart';
import 'package:quiz/utils/size_extension.dart';

class ProfileTab extends HookConsumerWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(profileProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          children: [
            buildAvatarInfo(context, ref),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                _logoutConfirmDialog(context, () {
                  notifier.onTapLogout(context);
                });
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(bottom: 24.w),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                height: 50.w,
                child: Text(
                  L.of(context).profile_logout,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red[300]),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future _logoutConfirmDialog(BuildContext context, VoidCallback confirm) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(L.of(context).globalHint),
          content: Text(L.of(context).profile_logout_content),
          actions: [
            CupertinoDialogAction(
              child: Text(L.of(context).globalCancel),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            CupertinoDialogAction(
                onPressed: () {
                  GoRouter.of(context).pop();
                  confirm();
                },
                child: Text(
                  L.of(context).globalConfirm,
                  style: const TextStyle(color: Colors.red),
                )),
          ],
        );
      },
    );
  }

  Widget buildAvatarInfo(BuildContext context, WidgetRef ref) {
    User user = ref.read(userProvider);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 160.w,
        padding: EdgeInsets.only(top: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Jazzicon.getIconWidget(
                Jazzicon.getJazziconData(82.w, address: user.avatar)),
            Padding(
              padding: EdgeInsets.only(top: 10.w),
              child: Text(
                user.nick,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.w),
              child: Text(
                user.identity,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ));
  }
}
