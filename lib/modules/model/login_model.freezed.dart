// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get nick => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  IdentityType get identityType => throw _privateConstructorUsedError;
  int get lastAt => throw _privateConstructorUsedError;
  String get identity => throw _privateConstructorUsedError;
  String get access_token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
      String avatar,
      String nick,
      int status,
      String region,
      IdentityType identityType,
      int lastAt,
      String identity,
      String access_token});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? avatar = null,
    Object? nick = null,
    Object? status = null,
    Object? region = null,
    Object? identityType = null,
    Object? lastAt = null,
    Object? identity = null,
    Object? access_token = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      nick: null == nick
          ? _value.nick
          : nick // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      identityType: null == identityType
          ? _value.identityType
          : identityType // ignore: cast_nullable_to_non_nullable
              as IdentityType,
      lastAt: null == lastAt
          ? _value.lastAt
          : lastAt // ignore: cast_nullable_to_non_nullable
              as int,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String avatar,
      String nick,
      int status,
      String region,
      IdentityType identityType,
      int lastAt,
      String identity,
      String access_token});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? avatar = null,
    Object? nick = null,
    Object? status = null,
    Object? region = null,
    Object? identityType = null,
    Object? lastAt = null,
    Object? identity = null,
    Object? access_token = null,
  }) {
    return _then(_$UserModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      nick: null == nick
          ? _value.nick
          : nick // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      identityType: null == identityType
          ? _value.identityType
          : identityType // ignore: cast_nullable_to_non_nullable
              as IdentityType,
      lastAt: null == lastAt
          ? _value.lastAt
          : lastAt // ignore: cast_nullable_to_non_nullable
              as int,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.uid,
      this.avatar = '0xb5cad6eb140e916dad4053f6832d797c17110721',
      this.nick = 'User',
      this.status = 0,
      this.region = "Global",
      this.identityType = IdentityType.UNKnow,
      this.lastAt = 0,
      this.identity = '',
      this.access_token = ''});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String uid;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final String nick;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final String region;
  @override
  @JsonKey()
  final IdentityType identityType;
  @override
  @JsonKey()
  final int lastAt;
  @override
  @JsonKey()
  final String identity;
  @override
  @JsonKey()
  final String access_token;

  @override
  String toString() {
    return 'UserModel(uid: $uid, avatar: $avatar, nick: $nick, status: $status, region: $region, identityType: $identityType, lastAt: $lastAt, identity: $identity, access_token: $access_token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.nick, nick) || other.nick == nick) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.identityType, identityType) ||
                other.identityType == identityType) &&
            (identical(other.lastAt, lastAt) || other.lastAt == lastAt) &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, avatar, nick, status,
      region, identityType, lastAt, identity, access_token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String uid,
      final String avatar,
      final String nick,
      final int status,
      final String region,
      final IdentityType identityType,
      final int lastAt,
      final String identity,
      final String access_token}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get avatar;
  @override
  String get nick;
  @override
  int get status;
  @override
  String get region;
  @override
  IdentityType get identityType;
  @override
  int get lastAt;
  @override
  String get identity;
  @override
  String get access_token;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
