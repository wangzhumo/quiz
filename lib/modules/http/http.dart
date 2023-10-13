import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:quiz/modules/http/base_response.dart';
import 'package:quiz/modules/http/host.dart';
import 'package:quiz/modules/http/interceptors/logger_interceptor.dart';
import 'package:quiz/modules/http/interceptors/params_interceptor.dart';
import 'package:quiz/utils/log/logger.dart';
import 'package:quiz/utils/text_utils.dart';

class Http {
  /// dio object
  static late Dio dio;
  static ParamInterceptor paramInterceptor = ParamInterceptor();

  /// default options
  static const Duration CONNECT_TIMEOUT = Duration(microseconds: 15);
  static const Duration RECEIVE_TIMEOUT = Duration(seconds: 5);

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String DELETE = 'delete';

  Http._() {
    BaseOptions options = BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        headers: {"user-agent": "dio"},
        baseUrl: ApiConst.host,
        responseType: ResponseType.plain);
    dio = Dio(options);
    // instance
    dio.interceptors.add(paramInterceptor);
    dio.interceptors.add(LoggerInterceptor());
    dio.interceptors
        .add(RetryInterceptor(dio: dio, retries: 3, retryDelays: const [
      Duration(seconds: 1),
      Duration(seconds: 3),
      Duration(seconds: 5),
    ]));
  }

  factory Http() => _getInstance();

  static Http? _instance;

  static Http _getInstance() {
    Http httpInstance = _instance ?? Http._();
    _instance ??= httpInstance;
    return httpInstance;
  }

  Future<BaseResponse> get(
    String url, {
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
    void Function(int count, int total)? onSendProgress,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    return _request(url,
            params: data,
            option: Options(method: GET),
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((value) => composeResponse(value));
  }

  Future<BaseResponse> post(
    String url, {
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
    void Function(int count, int total)? onSendProgress,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    return _request(url,
            params: data,
            option: Options(
                method: POST, contentType: "application/x-www-form-urlencoded"),
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((value) => composeResponse(value));
  }

  /// Json形式提交
  Future<BaseResponse> json(
    String url, {
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
    void Function(int count, int total)? onSendProgress,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    return _request(url,
            params: data,
            option: Options(method: POST, contentType: "application/json"),
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .then((value) => composeResponse(value));
  }

  ///统一请求
  Future<dynamic> _request(
    String url, {
    Map<String, dynamic>? params,
    FormData? form,
    Options? option,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    option = option ?? Options(method: GET);

    /// 添加公共参数.
    // ignore: prefer_typing_uninitialized_variables
    var result;

    try {
      Response response;
      if (TextUtils.equals(option.method, GET, unCase: true)) {
        response = await dio.request(url,
            queryParameters: params,
            options: option,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
      } else if (form != null) {
        // 表单上传，大多数用于上传文件
        response = await dio.request(url,
            data: form,
            options: option,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
      } else {
        response = await dio.request(url,
            data: params,
            options: option,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
      }
      result = response.data;
    } on DioException catch (e) {
      Logger().error('Request Error : $e', e.error, e.stackTrace);
    }
    return result;
  }

  /// compose response
  BaseResponse composeResponse(dynamic value) {
    if (value != null) {
      if (value is BaseResponse) {
        // 已经 ResponseInterceptor 处理过了
        return value;
      }
      BaseResponse response = BaseResponse.fromJson(value);
      return response;
    }
    return BaseResponse(-1, message: "网络错误");
  }

  /// release dio instance
  static release() {
    dio.close(force: true);
  }

  /// update token
  static updateToken(String token) {
    paramInterceptor.updateToken(token);
  }
}
