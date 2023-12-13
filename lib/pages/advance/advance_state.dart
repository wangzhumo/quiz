import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/generated/l10n.dart';
import 'package:quiz/modules/database/model/filter/filter_tag.dart';
import 'package:quiz/modules/database/model/filter/filter_tag_manager.dart';
import 'package:quiz/modules/router/routers.dart';

part 'advance_state.freezed.dart';

@freezed
class QuizAdvanceState with _$QuizAdvanceState {
  factory QuizAdvanceState(
      {required List<FilterTag> filterTags,
      required List<FilterTag> sortList}) = _QuizAdvanceState;
}

class QuizAdvanceNotifier extends StateNotifier<QuizAdvanceState> {
  final Future<FilterTagManager> ftm;
  QuizAdvanceNotifier(this.ftm, QuizAdvanceState state) : super(state) {
    // query
    queryFilterTag();
  }

  void queryFilterTag() async {
    // query local
    List<FilterTag> data = await ftm.then((value) => value.getFilterTag());
    if (data.isNotEmpty) {
      state = state.copyWith(filterTags: data);
    }
    // query remote and update local
  }

  void onBackTap(BuildContext context) {
    GoRouter.of(context).pop();
  }

  void onSearchTap(BuildContext context) {
    GoRouter.of(context).pushNamed(Routes.quizSearch);
  }

  void onTagSelected(FilterTag tag, bool checked) {
    if (checked) {
      // change checked target
      QuizAdvanceState newState = state.copyWith(
          filterTags:
              List.castFrom<FilterTag, FilterTag>(state.filterTags).map((e) {
        e.checked = e.id == tag.id;
        return e;
      }).toList());
      state = newState;
    }
  }

  void onSortSelected(FilterTag tag, bool checked) {
    if (checked) {
      // change checked target
      QuizAdvanceState newState = state.copyWith(
          sortList:
              List.castFrom<FilterTag, FilterTag>(state.sortList).map((e) {
        e.checked = e.id == tag.id;
        return e;
      }).toList());
      state = newState;
    }
  }
}

final quizAdvanceProvider =
    StateNotifierProvider.autoDispose<QuizAdvanceNotifier, QuizAdvanceState>(
        (ref) {
  // query filter tag
  Future<FilterTagManager> ftm = ref.watch(filterTagManagerProvider.future);
  // filter  emotion / character / work / relationship / ability
  List<FilterTag> tagList = [
    FilterTag()
      ..id = 1
      ..tagName = L.current.globalEmotion
      ..tagId = 1
      ..checked = true,
    FilterTag()
      ..id = 2
      ..tagName = L.current.globalCharacter
      ..tagId = 2,
    FilterTag()
      ..id = 3
      ..tagName = L.current.globalWork
      ..tagId = 3,
    FilterTag()
      ..id = 4
      ..tagName = L.current.globalRelationship
      ..tagId = 4,
    FilterTag()
      ..id = 5
      ..tagName = L.current.globalAbility
      ..tagId = 5,
    FilterTag()
      ..id = 6
      ..tagName = L.current.globalHealth
      ..tagId = 6,
    FilterTag()
      ..id = 7
      ..tagName = L.current.globalEntertainment
      ..tagId = 7,
  ];
  // sort  popular / recently / rating
  List<FilterTag> sortList = [
    FilterTag()
      ..id = 1
      ..tagName = L.current.globalPopular
      ..tagId = 1
      ..checked = true,
    FilterTag()
      ..id = 2
      ..tagName = L.current.globalRecently
      ..tagId = 2,
    FilterTag()
      ..id = 3
      ..tagName = L.current.globalRating
      ..tagId = 3
  ];
  QuizAdvanceState state =
      QuizAdvanceState(filterTags: tagList, sortList: sortList);
  return QuizAdvanceNotifier(ftm, state);
});
