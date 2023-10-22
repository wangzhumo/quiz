// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntroState {
  String get title => throw _privateConstructorUsedError;
  String get described => throw _privateConstructorUsedError;
  String get coverUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroStateCopyWith<IntroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroStateCopyWith<$Res> {
  factory $IntroStateCopyWith(
          IntroState value, $Res Function(IntroState) then) =
      _$IntroStateCopyWithImpl<$Res, IntroState>;
  @useResult
  $Res call({String title, String described, String coverUrl});
}

/// @nodoc
class _$IntroStateCopyWithImpl<$Res, $Val extends IntroState>
    implements $IntroStateCopyWith<$Res> {
  _$IntroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? described = null,
    Object? coverUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      described: null == described
          ? _value.described
          : described // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntroStateImplCopyWith<$Res>
    implements $IntroStateCopyWith<$Res> {
  factory _$$IntroStateImplCopyWith(
          _$IntroStateImpl value, $Res Function(_$IntroStateImpl) then) =
      __$$IntroStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String described, String coverUrl});
}

/// @nodoc
class __$$IntroStateImplCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$IntroStateImpl>
    implements _$$IntroStateImplCopyWith<$Res> {
  __$$IntroStateImplCopyWithImpl(
      _$IntroStateImpl _value, $Res Function(_$IntroStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? described = null,
    Object? coverUrl = null,
  }) {
    return _then(_$IntroStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      described: null == described
          ? _value.described
          : described // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IntroStateImpl implements _IntroState {
  _$IntroStateImpl(
      {required this.title, required this.described, required this.coverUrl});

  @override
  final String title;
  @override
  final String described;
  @override
  final String coverUrl;

  @override
  String toString() {
    return 'IntroState(title: $title, described: $described, coverUrl: $coverUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.described, described) ||
                other.described == described) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, described, coverUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroStateImplCopyWith<_$IntroStateImpl> get copyWith =>
      __$$IntroStateImplCopyWithImpl<_$IntroStateImpl>(this, _$identity);
}

abstract class _IntroState implements IntroState {
  factory _IntroState(
      {required final String title,
      required final String described,
      required final String coverUrl}) = _$IntroStateImpl;

  @override
  String get title;
  @override
  String get described;
  @override
  String get coverUrl;
  @override
  @JsonKey(ignore: true)
  _$$IntroStateImplCopyWith<_$IntroStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
