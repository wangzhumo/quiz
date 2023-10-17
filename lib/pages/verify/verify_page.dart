import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/resources/colors.dart';
import 'package:quiz/modules/router/routers.dart';
import 'package:quiz/pages/verify/verify_state.dart';
import 'package:quiz/utils/size_extension.dart';

class VerifyPage extends HookConsumerWidget {
  const VerifyPage(this.type, {super.key});

  /// email
  final String type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(verifyProvider.notifier);
    final state = ref.watch(verifyProvider);
    onPressed() {
      notifier.onTapVerify(context);
    }

    bool enable = notifier.hasComplete();
    bool sendState = state.status == 0;
    final onPressedOrNull = enable ? onPressed : null;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          L.of(context).verify_title,
          style: TextStyle(fontSize: 16.sp),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                _exitBindingDialog(context, () {
                  GoRouter.of(context).go(Routes.mainTabQuizzes);
                });
              },
              icon: const Icon(CupertinoIcons.back));
        }),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 24.w, left: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                      controller: notifier.controller,
                      onChanged: (value) {},
                      readOnly: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: QColors.line)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: QColors.line))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.w),
                      child: Text(
                        L.of(context).login_verify_code,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textInputAction: TextInputAction.done,
                          onChanged: (value) => notifier.updateCode(value),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 12.sp),
                              counterText: '',
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: L.of(context).login_code_input),
                        )),
                        SizedBox(
                          width: 60.w,
                          height: 32.w,
                          child: CupertinoButton(
                              color: Colors.black,
                              padding: EdgeInsets.zero,
                              disabledColor: QColors.disabled,
                              onPressed:
                                  sendState ? notifier.sendVerifyCode : null,
                              child: Text(
                                sendState
                                    ? L.of(context).verify_send_code
                                    : '${state.status} s',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              )),
                        )
                      ],
                    )
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50.w),
              child: MaterialButton(
                  onPressed: onPressedOrNull,
                  minWidth: double.infinity,
                  height: 50.w,
                  color: Colors.black,
                  disabledColor: Colors.grey[700],
                  highlightColor: Colors.black,
                  child: Text(
                    L.of(context).verify,
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future _exitBindingDialog(BuildContext context, VoidCallback confirm) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(L.of(context).globalHint),
          content: Text(L.of(context).verify_exit_content),
          actions: [
            CupertinoDialogAction(
              child: Text(L.of(context).globalCancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  confirm();
                },
                child: Text(
                  L.of(context).globalConfirm,
                )),
          ],
        );
      },
    );
  }
}
