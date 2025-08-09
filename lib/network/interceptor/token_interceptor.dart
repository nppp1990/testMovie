import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  static const _apiToken = 'todo';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $_apiToken';
    super.onRequest(options, handler);
  }
}
