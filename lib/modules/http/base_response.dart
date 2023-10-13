import 'dart:convert';

class BaseResponse {
  String? message = '';
  int code = -1;
  Object? data;
  String? lastId = '';
  bool? more = false; // 如果为true说明还有数据

  BaseResponse(this.code, {this.message});

  BaseResponse.fromJson(String value) {
    try {
      Map<String, dynamic> jsonObject = json.decode(value);
      message = jsonObject['message'];
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
  bool isEmpty() {
    // 1.请求是成功的
    // 2.data == null
    // 3.data isEmpty
    if (data != null) {
      return false;
    }
    if (data is List && (data as List).isNotEmpty) {
      return false;
    }
    return true;
  }

  String getMessage() {
    return message ?? "";
  }

  int getCode() {
    return code;
  }

  @override
  String toString() {
    return 'BaseResponse{message: $message, code: $code, data: $data}';
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'code': code,
        'more': more,
        'last_id': lastId,
        'data': data,
      };

  bool hasMore() {
    return more ?? false;
  }
}
