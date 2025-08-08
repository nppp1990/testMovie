import 'package:dio/dio.dart';
import 'package:yj_moive/network/interceptor/locale_interceptor.dart';
import 'package:yj_moive/network/interceptor/token_interceptor.dart';

import 'index.dart';

class RequestManager {
  static late RestClient _client;
  static final RequestManager _instance = RequestManager._init();

  RequestManager._init() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    );
    dio.interceptors.add(TokenInterceptor());
    dio.interceptors.add(LocaleInterceptor());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    _client = RestClient(dio);
  }

  factory RequestManager() => _instance;

  RestClient get client => _client;


}
