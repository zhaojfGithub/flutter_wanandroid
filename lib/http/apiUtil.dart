import 'package:dio/dio.dart';
import 'package:fun_wanandroid/http/api.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:fun_wanandroid/utils/logUtil.dart';

class ApiUtil {
  static ApiUtil? _instance;

  late Dio dio;

  late BaseOptions options;

  late CancelToken cancelToken;

  factory ApiUtil.getInstance() {
    return _instance ??= ApiUtil._private();
  }

  ApiUtil._private() {
    options = BaseOptions(
        baseUrl: Api.BASE_URL,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 5),
        headers: {"version": "1.0.0"},
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.plain);
    dio = Dio(options);
    final cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(_getInterceptorsWrapper());
    cancelToken = CancelToken();
  }

  InterceptorsWrapper _getInterceptorsWrapper() {
    return InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
      // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      //相应之前
      // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
      return handler.next(response);
    }, onError: (DioException e, ErrorInterceptorHandler handler) {
      //错误之前
      // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
      return handler.next(e);
    });
  }

  get(url, {data, options, cancelToken}) async {
    try {
      return await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
    } on DioException catch (e) {
      //错误处理
      formatError(e);
    }
  }

  post(url, {data, options, cancelToken}) async {
    try {
      return await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
    } on DioException catch (e) {
      //错误处理
      formatError(e);
    }
  }

  /*
   * error统一处理
   */
  void formatError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      // It occurs when url is opened timeout.
      LogUtil.log("连接超时");
    } else if (e.type == DioExceptionType.sendTimeout) {
      // It occurs when url is sent timeout.
      LogUtil.log("请求超时");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      //It occurs when receiving timeout
      LogUtil.log("响应超时");
    } else if (e.type == DioExceptionType.badResponse) {
      // When the server response, but with a incorrect status, such as 404, 503...
      LogUtil.log("出现异常");
    } else if (e.type == DioExceptionType.cancel) {
      // When the request is cancelled, dio will throw a error with this type.
      LogUtil.log("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      LogUtil.log("未知错误");
    }
  }
}
