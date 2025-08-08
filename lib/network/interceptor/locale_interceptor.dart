import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

class LocaleInterceptor extends Interceptor {
  static const String _languageKey = 'language';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.method == HttpMethod.GET && options.queryParameters[_languageKey] == null) {
      // todo 国际化切换这里改一下，先写死为中文
      options.queryParameters[_languageKey] = 'zh-CN';
    }
    super.onRequest(options, handler);
  }
}