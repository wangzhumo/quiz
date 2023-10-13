// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  IdentityType get identityType => throw _privateConstructorUsedError;
  String? get identity => throw _privateConstructorUsedError;
  String? get credential => throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {IdentityType identityType,
      String? identity,
      String? credential,
      bool enable});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identityType = null,
    Object? identity = freezed,
    Object? credential = freezed,
    Object? enable = null,
  }) {
    return _then(_value.copyWith(
      identityType: null == identityType
          ? _value.identityType
          : identityType // ignore: cast_nullable_to_non_nullable
              as IdentityType,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String?,
      credential: freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IdentityType identityType,
      String? identity,
      String? credential,
      bool enable});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identityType = null,
    Object? identity = freezed,
    Object? credential = freezed,
    Object? enable = null,
  }) {
    return _then(_$LoginStateImpl(
      identityType: null == identityType
          ? _value.identityType
          : identityType // ignore: cast_nullable_to_non_nullable
              as IdentityType,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String?,
      credential: freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  _$LoginStateImpl(
      {this.identityType = IdentityType.UNKnow,
      required this.identity,
      required this.credential,
      this.enable = false});

  @override
  @JsonKey()
  final IdentityType identityType;
  @override
  final String? identity;
  @override
  final String? credential;
  @override
  @JsonKey()
  final bool enable;

  @override
  String toString() {
    return 'LoginState(identityType: $identityType, identity: $identity, credential: $credential, enable: $enable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.identityType, identityType) ||
                other.identityType == identityType) &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.credential, credential) ||
                other.credential == credential) &&
            (identical(other.enable, enable) || other.enable == enable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, identityType, identity, credential, enable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final IdentityType identityType,
      required final String? identity,
      required final String? credential,
      final bool enable}) = _$LoginStateImpl;

  @override
  IdentityType get identityType;
  @override
  String? get identity;
  @override
  String? get credential;
  @override
  bool get enable;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
