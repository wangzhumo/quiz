import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/pages/advance/advance_state.dart';
import 'package:quiz/utils/size_extension.dart';

class QuizzesAdvancePage extends HookConsumerWidget {
  const QuizzesAdvancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    QuizAdvanceNotifier notifier = ref.read(quizAdvanceProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).custom.backgroundColor,
      body: EasyRefresh.builder(childBuilder: (context, physical) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              leading: Builder(builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: IconButton(
                      onPressed: () => notifier.onBackTap(context),
                      icon: const Icon(Icons.close)),
                );
              }),
              actions: [
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 14.w),
                    child: const Icon(Icons.search_rounded),
                  ),
                  onTap: () => notifier.onSearchTap(context),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
