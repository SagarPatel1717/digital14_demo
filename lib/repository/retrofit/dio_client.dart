import 'package:dio/dio.dart';

class DioClient {
  CancelToken eventListAPiCancelToken = CancelToken();

  static Dio _dio = Dio();
  static Dio getInstance() {
    _initializeInterceptors();
    return _dio;
  }

  static _initializeInterceptors() {

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        final header = {
          'content-type': 'application/json',
        };
        options.headers = header;
      options.connectTimeout = 200000;
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
