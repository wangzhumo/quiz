import 'package:quiz/modules/http/api_response.dart';
import 'package:quiz/modules/http/host.dart';
import 'package:quiz/modules/http/http.dart';
import 'package:quiz/modules/identityType.dart';
import 'package:quiz/modules/model/login_model.dart';

abstract class ILoginRespository {
  Future<ApiResponse<UserModel>> signIn(
      IdentityType identityType, String identity, String credential);
}

class LoginRespository implements ILoginRespository {
  @override
  Future<ApiResponse<UserModel>> signIn(
      IdentityType identityType, String identity, String credential) {
    String signInUrl = "${ApiConst.UCenter}/signin";
    return Http().json(signInUrl, data: {
      "identityType": IdentityType.Email.type(),
      "identity": identity,
      "credential": credential
    }).then((value) {
      if (value.isSuccessful()) {
        UserModel model = UserModel.fromJson(value.data);
        return ApiResponse.base(value, data: model);
      }
      return ApiResponse.error(value.getMessage(), code: value.code);
    });
  }
}
