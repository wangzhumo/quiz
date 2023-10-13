import 'dart:convert';

class BaseResponse {
  String? msg = '';
  int code = -1;
  Map<String, dynamic> data = {};
  String? lastId = '';
  bool more = false;

  BaseResponse(this.code, {this.msg});

  BaseResponse.fromJson(String value) {
    try {
      Map<String, dynamic> jsonObject = json.decode(value);
      msg = jsonObject['msg'];
      code = jsonObject['code'];
      data = jsonObject['data'];
      more = jsonObject['more'];
      var tempLastId = jsonObject['last_id'];
      if (tempLastId != null) {
        lastId = tempLastId.toString();
      }
    } catch (e) {}
  }

  bool isSuccessful() {
    if (code == 0) {
      return true;
    }
    return false;
  }

  /// 必须是在请求成功的前提下使用
  bool isEmptyList() {
    // 1.请求是成功的
    // 2.data == null
    // 3.data isEmpty
    if (data is List && (data as List).isNotEmpty) {
      return false;
    }
    return true;
  }

  String getMessage() {
    return msg ?? "";
  }

  int getCode() {
    return code;
  }

  @override
  String toString() {
    return 'BaseResponse{message: $msg, code: $code, data: $data}';
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'code': code,
        'more': more,
        'last_id': lastId,
        'data': data,
      };

  bool hasMore() {
    return more;
  }
}
