import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:retrofit/http.dart';

class LocaleInterceptor extends Interceptor {
  static const String _languageKey = 'language';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.method == HttpMethod.GET && options.queryParameters[_languageKey] == null) {
      // 目前就只做了两个语言
      bool isZh = Get.locale?.languageCode == 'zh';
      options.queryParameters[_languageKey] = isZh ? 'zh-CN' : 'en-US';
    }
    super.onRequest(options, handler);
  }
}