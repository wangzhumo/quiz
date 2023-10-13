import 'base_response.dart';

///我们希望,在API接口返回数据之后,由我们自己解析
///但是带来一个问题,这样会导致,每一个到页面的数据都不同
///这里用ApiResponse包装一下,统一到页面的数据.
class ApiResponse<T> {
  //它的数据一定是由BaseResponse构成的,只是不需要data -> map
  String? msg;
  int code = 0;
  T? data;
  bool more = false;
  String? lastId;

  ApiResponse(this.code, {this.data, this.msg, this.more = false, this.lastId});

  ///判断请求是否成功.
  bool isSuccessful() {
    if (code == 0) {
      return true;
    }
    return false;
  }

  /// 是否有更多
  bool hasMore() {
    return more;
  }

  /// 快速生成一个错误ApiResponse
  ApiResponse.error(String this.msg, {this.code = -1});

  /// 快速生成一个空ApiResponse
  ApiResponse.empty({this.code = 0, this.data, String this.msg = 'Empty Data'});

  /// ApiResponse统一返回
  ApiResponse.base(BaseResponse response, {this.data}) {
    this.code = response.code;
    this.more = response.hasMore();
    this.lastId = response.lastId;
    this.msg = response.msg;
  }

  ApiResponse.fake(this.msg, this.code, {this.data}) {
    this.more = false;
    this.lastId = '0';
  }
}
