// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerifyState {
  int get status => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String? get codeKey => throw _privateConstructorUsedError;
  String get identity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyStateCopyWith<VerifyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyStateCopyWith<$Res> {
  factory $VerifyStateCopyWith(
          VerifyState value, $Res Function(VerifyState) then) =
      _$VerifyStateCopyWithImpl<$Res, VerifyState>;
  @useResult
  $Res call({int status, String code, String? codeKey, String identity});
}

/// @nodoc
class _$VerifyStateCopyWithImpl<$Res, $Val extends VerifyState>
    implements $VerifyStateCopyWith<$Res> {
  _$VerifyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? codeKey = freezed,
    Object? identity = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      codeKey: freezed == codeKey
          ? _value.codeKey
          : codeKey // ignore: cast_nullable_to_non_nullable
              as String?,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $VerifyStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String code, String? codeKey, String identity});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$VerifyStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? codeKey = freezed,
    Object? identity = null,
  }) {
    return _then(_$LoginStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      codeKey: freezed == codeKey
          ? _value.codeKey
          : codeKey // ignore: cast_nullable_to_non_nullable
              as String?,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  _$LoginStateImpl(
      {this.status = 0, this.code = '', this.codeKey, required this.identity});

  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final String code;
  @override
  final String? codeKey;
  @override
  final String identity;

  @override
  String toString() {
    return 'VerifyState(status: $status, code: $code, codeKey: $codeKey, identity: $identity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.codeKey, codeKey) || other.codeKey == codeKey) &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, code, codeKey, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements VerifyState {
  factory _LoginState(
      {final int status,
      final String code,
      final String? codeKey,
      required final String identity}) = _$LoginStateImpl;

  @override
  int get status;
  @override
  String get code;
  @override
  String? get codeKey;
  @override
  String get identity;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
