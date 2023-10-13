// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      avatar: json['avatar'] as String? ??
          '0xb5cad6eb140e916dad4053f6832d797c17110721',
      nick: json['nick'] as String? ?? 'User',
      status: json['status'] as int? ?? 0,
      region: json['region'] as String? ?? "Global",
      identityType:
          $enumDecodeNullable(_$IdentityTypeEnumMap, json['identityType']) ??
              IdentityType.UNKnow,
      identity: json['identity'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'avatar': instance.avatar,
      'nick': instance.nick,
      'status': instance.status,
      'region': instance.region,
      'identityType': _$IdentityTypeEnumMap[instance.identityType]!,
      'identity': instance.identity,
    };

const _$IdentityTypeEnumMap = {
  IdentityType.UNKnow: 0,
  IdentityType.Email: 1,
  IdentityType.Google: 2,
  IdentityType.Apple: 3,
};
