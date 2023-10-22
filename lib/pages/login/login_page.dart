import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/pages/login/login_state.dart';
import 'package:quiz/utils/size_extension.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          leading: Builder(builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: IconButton(
                  onPressed: () {
                    notifier.onTapBack(context);
                  },
                  icon: const Icon(Icons.close)),
            );
          })),
      body: HookConsumer(
        builder: (context, ref, _) {
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
                  padding: EdgeInsets.only(top: 16.w),
                  child: Text(
                    L.of(context).login_welcome,
                    style:
                        TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.w),
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
                          hintStyle: TextStyle(fontSize: 12.sp),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: L.of(context).login_email_input),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22.w),
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
                          hintStyle: TextStyle(fontSize: 12.sp),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: L.of(context).login_password_input),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.w),
                      child: GestureDetector(
                        child: Text(
                          L.of(context).login_forget_psd,
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 12.sp),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.w),
                      child: MaterialButton(
                          onPressed: onPressedOrNull,
                          minWidth: double.infinity,
                          height: 50.w,
                          color: Colors.black,
                          disabledColor: Colors.grey[700],
                          highlightColor: Colors.black,
                          child: Text(
                            L.of(context).globalSignIn,
                            style:
                                TextStyle(fontSize: 21.sp, color: Colors.white),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.w),
                      child: GestureDetector(
                        onTap: () => notifier.onTapSignUp(context),
                        child: Center(
                          child: Text(
                            L.of(context).register_email,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 14.sp),
                          ),
                        ),
                      ),
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
