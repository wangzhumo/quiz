import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/modules/database/model/quiz_search.dart';
import 'package:quiz/modules/database/model/search_tag_manager.dart';

part 'search_state.freezed.dart';

@freezed
class QuizSearchState with _$QuizSearchState {
  factory QuizSearchState(
      {required List<SearchTag> historyKeys,
      required List<SearchTag> hotKeys,
      @Default(false) bool delete,
      @Default('') String keyword}) = _QuizSearchState;
}

class QuizSearchNotifier extends StateNotifier<QuizSearchState> {
  final Future<SearchTagManager> searchTag;

  QuizSearchNotifier(super.state, this.searchTag) {
    querySearchData();
  }

  void querySearchData() {
    searchTag
        .then((value) => value.getSearchHistory())
        .then((value) => {state = state.copyWith(historyKeys: value)});
  }

  void onSearchKeywordChange(String keyword) {
    state = state.copyWith(keyword: keyword);
  }

  void onSearchKeyword() {
    if (state.keyword.isNotEmpty) {
      searchTag.then((value) => value.addHistory(state.keyword)).then((value) {
        List<SearchTag> newList = List.empty(growable: true);
        newList.addAll(state.historyKeys);
        if (newList.length >= 20) {
          newList.removeLast();
        }
        newList.insert(0, value);
        state = state.copyWith(historyKeys: newList);
      });
    }
  }

  void onToggleDelete() {
    state = state.copyWith(delete: !state.delete);
  }

  void onSearchKeywordRemove(SearchTag tag) {
    searchTag.then((value) => value.removeHistory(tag.id)).then((value)  {
      List<SearchTag> newList = List.empty(growable: true);
      newList.addAll(state.historyKeys);
      newList.removeWhere((element) => element.id == tag.id);
      state = state.copyWith(historyKeys: newList);
    });
  }
}

final quizSearchProvider =
    StateNotifierProvider.autoDispose<QuizSearchNotifier, QuizSearchState>(
        (ref) {
  return QuizSearchNotifier(
      QuizSearchState(
          historyKeys: List<SearchTag>.empty(growable: true),
          hotKeys: List<SearchTag>.empty(growable: true)),
      ref.watch(searchTagManagerProvider.future));
});
