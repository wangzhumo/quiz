import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/modules/identityType.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    @Default('0xb5cad6eb140e916dad4053f6832d797c17110721') String avatar,
    @Default('User') String nick,
    @Default(0) int status,
    @Default("Global") String region,
    @Default(IdentityType.UNKnow) IdentityType identityType,
    required String identity,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
