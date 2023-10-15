import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/utils/size_extension.dart';
import 'register_state.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                notifier.onTapBack(context);
              },
              icon: const Icon(CupertinoIcons.back));
        }),
      ),
      body: HookConsumer(
        builder: (context, ref, _) {
          final state = ref.watch(registerProvider);
          onPressed() {
            notifier.onTabSignIn(context);
          }

          final onPressedOrNull = state.enable ? onPressed : null;
          return Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  child: Image.asset(
                    "assets/images/app_logo.png",
                    width: 62.w,
                    height: 62.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 18.w),
                  child: Text(
                    L.of(context).register_email,
                    style:
                        TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 22.w),
                      child: Text(
                        L.of(context).register_nick,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.normal),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      onChanged: (value) => notifier.updateNick(value),
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: L.of(context).register_nick_input),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22.w),
                      child: Text(
                        L.of(context).login_email,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.normal),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      onChanged: (value) => notifier.updateIdentity(value),
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: L.of(context).login_email_input),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.w),
                      child: Text(
                        L.of(context).login_password,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.normal),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.characters,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      obscureText: true,
                      onChanged: (value) => notifier.updateCredential(value),
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: L.of(context).login_password_input),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.w),
                      child: MaterialButton(
                          onPressed: onPressedOrNull,
                          minWidth: double.infinity,
                          height: 50.w,
                          color: Colors.black,
                          disabledColor: Colors.grey[700],
                          highlightColor: Colors.black,
                          child: Text(
                            L.of(context).globalSingUp,
                            style:
                                TextStyle(fontSize: 21.sp, color: Colors.white),
                          )),
                    )
                  ],
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
