import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz/components/searchBar/app_search_bar.dart';
import 'package:quiz/modules/database/model/quiz_search.dart';
import 'package:quiz/modules/theme/theme.dart';
import 'package:quiz/pages/search/search_state.dart';
import 'package:quiz/utils/size_extension.dart';

class QuizzesSearchPage extends HookConsumerWidget {
  const QuizzesSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    QuizSearchNotifier notifier = ref.watch(quizSearchProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).custom.backgroundColor,
      appBar: AppSearchBar(
        backgroundColor: Theme.of(context).custom.backgroundColor,
        searchBackgroundColor: Theme.of(context).custom.btColor,
        hintTextStyle: TextStyle(
            fontSize: 14.sp, color: Theme.of(context).custom.hintTextColor),
        onSearchTap: () => {notifier.onSearchKeyword()},
        onChanged: (keyword) => {notifier.onSearchKeywordChange(keyword)},
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            _buildHistory(context, notifier, ref),
            _buildHotSearch(context, notifier, ref)
          ],
        ),
      ),
    );
  }

  // build history search widget
  Widget _buildHistory(
      BuildContext context, QuizSearchNotifier notifier, WidgetRef ref) {
    bool deleteState = ref.watch(quizSearchProvider).delete;
    List<SearchTag> data = ref.watch(quizSearchProvider).historyKeys;
    if (data.isEmpty) {
      return Container();
    }

    onDelete(SearchTag tag) {
      notifier.onSearchKeywordRemove(tag);
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.w,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "历史搜索",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                deleteState
                    ? IconButton(
                        onPressed: () => notifier.onToggleDelete(),
                        icon: Icon(
                          Icons.join_right,
                          size: 16.w,
                        ))
                    : IconButton(
                        onPressed: () => notifier.onToggleDelete(),
                        icon: Icon(
                          Icons.edit_document,
                          size: 16.w,
                        ))
              ],
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 6.w,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: data
                .map((e) => _historyChip(context, deleteState, e, onDelete))
                .toList(growable: false),
          )
        ],
      ),
    );
  }

  // build recommend search widget
  Widget _buildHotSearch(
      BuildContext context, QuizSearchNotifier notifier, WidgetRef ref) {
    List<SearchTag> data = ref.watch(quizSearchProvider).hotKeys;
    if (data.isEmpty) {
      return Container();
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 30.w,
            child:
                Text("热门搜索", style: Theme.of(context).textTheme.headlineSmall),
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 6.w,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children:
                data.map((e) => _hotChip(context, e)).toList(growable: false),
          )
        ],
      ),
    );
  }

  Widget _historyChip(
      BuildContext context, bool deleteState, SearchTag tag, onDelete) {
    if (deleteState) {
      return Chip(
          padding: EdgeInsets.zero,
          onDeleted: () => onDelete(tag),
          label: Text(tag.keyword,
              style: Theme.of(context).textTheme.labelMedium));
    }
    return Chip(
        padding: EdgeInsets.zero,
        label:
            Text(tag.keyword, style: Theme.of(context).textTheme.labelMedium));
  }

  Widget _hotChip(BuildContext context, SearchTag tag) {
    return Chip(
        padding: EdgeInsets.zero,
        label:
            Text(tag.keyword, style: Theme.of(context).textTheme.labelMedium));
  }
}
