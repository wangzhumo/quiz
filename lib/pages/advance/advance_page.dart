import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/pages/advance/advance_state.dart';
import 'package:quiz/utils/size_extension.dart';

class QuizzesAdvancePage extends HookConsumerWidget {
  const QuizzesAdvancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    QuizAdvanceNotifier notifier = ref.watch(quizAdvanceProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).custom.backgroundColor,
      body: EasyRefresh.builder(childBuilder: (context, physical) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).custom.backgroundColor,
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
              expandedHeight: 150.w,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.fromLTRB(14.w, 0, 0, 8.w),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40.w,
                            child: Text(L.of(context).advance_tags),
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 4.w,
                              children: ref
                                  .watch(quizAdvanceProvider)
                                  .filterTags
                                  .map((e) => _buildTag(
                                      e.tagName,
                                      e.checked,
                                      context,
                                      (bool checked) =>
                                          notifier.onTagSelected(e, checked)))
                                  .toList(),
                            ),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40.w,
                            child: Text(L.of(context).advance_sort),
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 4.w,
                              children: ref
                                  .watch(quizAdvanceProvider)
                                  .sortList
                                  .map((e) => _buildTag(
                                      e.tagName,
                                      e.checked,
                                      context,
                                      (bool checked) =>
                                          notifier.onSortSelected(e, checked)))
                                  .toList(),
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              pinned: true,
              snap: false,
              floating: false,
              scrolledUnderElevation: 0,
            ),
            SliverList.list(
                children: List.generate(
                    20,
                    (index) => Container(
                          height: 100.w,
                          margin: EdgeInsets.only(bottom: 20.w),
                          color: Colors.deepOrange,
                        )))
          ],
        );
      }),
    );
  }

  Widget _buildTag(String label, bool selected, BuildContext context,
      ValueChanged<bool> onSelected) {
    return ChoiceChip(
        label: Text(label),
        onSelected: onSelected,
        padding: EdgeInsets.zero,
        side: BorderSide.none,
        showCheckmark: false,
        labelStyle: TextStyle(
            fontSize: 12.sp,
            color: selected
                ? Theme.of(context).custom.selectedColor
                : Theme.of(context).custom.textColor),
        color: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),
        selected: selected);
  }
}
