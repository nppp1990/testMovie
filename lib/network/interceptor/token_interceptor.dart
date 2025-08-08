import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  static const _apiToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiM2VmMDAwYTZiMGIxZjA2ZGEyZDMyYjc4ZTU2M2VhMSIsIm5iZiI6MTc1NDU1NDE2Mi4yODcwMDAyLCJzdWIiOiI2ODk0NWYzMjNmNzkyODhlMmJhMzJhY2EiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.4SF52-G4L5MMNLTOHEfb5YciqCp2mfRDPSD6Bl1ab8I';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $_apiToken';
    super.onRequest(options, handler);
  }
}
