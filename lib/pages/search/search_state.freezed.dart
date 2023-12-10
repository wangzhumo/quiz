// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizSearchState {
  List<SearchTag> get historyKeys => throw _privateConstructorUsedError;
  List<SearchTag> get hotKeys => throw _privateConstructorUsedError;
  bool get delete => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizSearchStateCopyWith<QuizSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSearchStateCopyWith<$Res> {
  factory $QuizSearchStateCopyWith(
          QuizSearchState value, $Res Function(QuizSearchState) then) =
      _$QuizSearchStateCopyWithImpl<$Res, QuizSearchState>;
  @useResult
  $Res call(
      {List<SearchTag> historyKeys,
      List<SearchTag> hotKeys,
      bool delete,
      String keyword});
}

/// @nodoc
class _$QuizSearchStateCopyWithImpl<$Res, $Val extends QuizSearchState>
    implements $QuizSearchStateCopyWith<$Res> {
  _$QuizSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyKeys = null,
    Object? hotKeys = null,
    Object? delete = null,
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      historyKeys: null == historyKeys
          ? _value.historyKeys
          : historyKeys // ignore: cast_nullable_to_non_nullable
              as List<SearchTag>,
      hotKeys: null == hotKeys
          ? _value.hotKeys
          : hotKeys // ignore: cast_nullable_to_non_nullable
              as List<SearchTag>,
      delete: null == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizSearchStateImplCopyWith<$Res>
    implements $QuizSearchStateCopyWith<$Res> {
  factory _$$QuizSearchStateImplCopyWith(_$QuizSearchStateImpl value,
          $Res Function(_$QuizSearchStateImpl) then) =
      __$$QuizSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SearchTag> historyKeys,
      List<SearchTag> hotKeys,
      bool delete,
      String keyword});
}

/// @nodoc
class __$$QuizSearchStateImplCopyWithImpl<$Res>
    extends _$QuizSearchStateCopyWithImpl<$Res, _$QuizSearchStateImpl>
    implements _$$QuizSearchStateImplCopyWith<$Res> {
  __$$QuizSearchStateImplCopyWithImpl(
      _$QuizSearchStateImpl _value, $Res Function(_$QuizSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyKeys = null,
    Object? hotKeys = null,
    Object? delete = null,
    Object? keyword = null,
  }) {
    return _then(_$QuizSearchStateImpl(
      historyKeys: null == historyKeys
          ? _value._historyKeys
          : historyKeys // ignore: cast_nullable_to_non_nullable
              as List<SearchTag>,
      hotKeys: null == hotKeys
          ? _value._hotKeys
          : hotKeys // ignore: cast_nullable_to_non_nullable
              as List<SearchTag>,
      delete: null == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuizSearchStateImpl implements _QuizSearchState {
  _$QuizSearchStateImpl(
      {required final List<SearchTag> historyKeys,
      required final List<SearchTag> hotKeys,
      this.delete = false,
      this.keyword = ''})
      : _historyKeys = historyKeys,
        _hotKeys = hotKeys;

  final List<SearchTag> _historyKeys;
  @override
  List<SearchTag> get historyKeys {
    if (_historyKeys is EqualUnmodifiableListView) return _historyKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyKeys);
  }

  final List<SearchTag> _hotKeys;
  @override
  List<SearchTag> get hotKeys {
    if (_hotKeys is EqualUnmodifiableListView) return _hotKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotKeys);
  }

  @override
  @JsonKey()
  final bool delete;
  @override
  @JsonKey()
  final String keyword;

  @override
  String toString() {
    return 'QuizSearchState(historyKeys: $historyKeys, hotKeys: $hotKeys, delete: $delete, keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizSearchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._historyKeys, _historyKeys) &&
            const DeepCollectionEquality().equals(other._hotKeys, _hotKeys) &&
            (identical(other.delete, delete) || other.delete == delete) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_historyKeys),
      const DeepCollectionEquality().hash(_hotKeys),
      delete,
      keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizSearchStateImplCopyWith<_$QuizSearchStateImpl> get copyWith =>
      __$$QuizSearchStateImplCopyWithImpl<_$QuizSearchStateImpl>(
          this, _$identity);
}

abstract class _QuizSearchState implements QuizSearchState {
  factory _QuizSearchState(
      {required final List<SearchTag> historyKeys,
      required final List<SearchTag> hotKeys,
      final bool delete,
      final String keyword}) = _$QuizSearchStateImpl;

  @override
  List<SearchTag> get historyKeys;
  @override
  List<SearchTag> get hotKeys;
  @override
  bool get delete;
  @override
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$QuizSearchStateImplCopyWith<_$QuizSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
