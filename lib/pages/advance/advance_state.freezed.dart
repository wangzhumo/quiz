// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizAdvanceState {
  List<FilterTag> get filterTags => throw _privateConstructorUsedError;
  List<FilterTag> get sortList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizAdvanceStateCopyWith<QuizAdvanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAdvanceStateCopyWith<$Res> {
  factory $QuizAdvanceStateCopyWith(
          QuizAdvanceState value, $Res Function(QuizAdvanceState) then) =
      _$QuizAdvanceStateCopyWithImpl<$Res, QuizAdvanceState>;
  @useResult
  $Res call({List<FilterTag> filterTags, List<FilterTag> sortList});
}

/// @nodoc
class _$QuizAdvanceStateCopyWithImpl<$Res, $Val extends QuizAdvanceState>
    implements $QuizAdvanceStateCopyWith<$Res> {
  _$QuizAdvanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterTags = null,
    Object? sortList = null,
  }) {
    return _then(_value.copyWith(
      filterTags: null == filterTags
          ? _value.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<FilterTag>,
      sortList: null == sortList
          ? _value.sortList
          : sortList // ignore: cast_nullable_to_non_nullable
              as List<FilterTag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizAdvanceStateImplCopyWith<$Res>
    implements $QuizAdvanceStateCopyWith<$Res> {
  factory _$$QuizAdvanceStateImplCopyWith(_$QuizAdvanceStateImpl value,
          $Res Function(_$QuizAdvanceStateImpl) then) =
      __$$QuizAdvanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FilterTag> filterTags, List<FilterTag> sortList});
}

/// @nodoc
class __$$QuizAdvanceStateImplCopyWithImpl<$Res>
    extends _$QuizAdvanceStateCopyWithImpl<$Res, _$QuizAdvanceStateImpl>
    implements _$$QuizAdvanceStateImplCopyWith<$Res> {
  __$$QuizAdvanceStateImplCopyWithImpl(_$QuizAdvanceStateImpl _value,
      $Res Function(_$QuizAdvanceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterTags = null,
    Object? sortList = null,
  }) {
    return _then(_$QuizAdvanceStateImpl(
      filterTags: null == filterTags
          ? _value._filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<FilterTag>,
      sortList: null == sortList
          ? _value._sortList
          : sortList // ignore: cast_nullable_to_non_nullable
              as List<FilterTag>,
    ));
  }
}

/// @nodoc

class _$QuizAdvanceStateImpl implements _QuizAdvanceState {
  _$QuizAdvanceStateImpl(
      {required final List<FilterTag> filterTags,
      required final List<FilterTag> sortList})
      : _filterTags = filterTags,
        _sortList = sortList;

  final List<FilterTag> _filterTags;
  @override
  List<FilterTag> get filterTags {
    if (_filterTags is EqualUnmodifiableListView) return _filterTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterTags);
  }

  final List<FilterTag> _sortList;
  @override
  List<FilterTag> get sortList {
    if (_sortList is EqualUnmodifiableListView) return _sortList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortList);
  }

  @override
  String toString() {
    return 'QuizAdvanceState(filterTags: $filterTags, sortList: $sortList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizAdvanceStateImpl &&
            const DeepCollectionEquality()
                .equals(other._filterTags, _filterTags) &&
            const DeepCollectionEquality().equals(other._sortList, _sortList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filterTags),
      const DeepCollectionEquality().hash(_sortList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizAdvanceStateImplCopyWith<_$QuizAdvanceStateImpl> get copyWith =>
      __$$QuizAdvanceStateImplCopyWithImpl<_$QuizAdvanceStateImpl>(
          this, _$identity);
}

abstract class _QuizAdvanceState implements QuizAdvanceState {
  factory _QuizAdvanceState(
      {required final List<FilterTag> filterTags,
      required final List<FilterTag> sortList}) = _$QuizAdvanceStateImpl;

  @override
  List<FilterTag> get filterTags;
  @override
  List<FilterTag> get sortList;
  @override
  @JsonKey(ignore: true)
  _$$QuizAdvanceStateImplCopyWith<_$QuizAdvanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
