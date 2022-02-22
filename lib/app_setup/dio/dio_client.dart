import 'package:angleswing_skill_assesment/app_setup/dio/interceptors/error_interceptor.dart';
import 'package:angleswing_skill_assesment/app_setup/dio/interceptors/response_interceprot.dart';
import 'package:dio/dio.dart';

const String requiredToken = 'tokenRequired';

class DioClient {
  Dio dioClient() {
    Dio _dio = Dio();
    _dio.options.baseUrl =
        "https://angelswing-frontend-test-serverless-api.vercel.app";
    _dio.options.connectTimeout = 6000;
    _dio.options.receiveTimeout = 6000;
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.extra = <String, Object>{requiredToken: false};
    _dio.interceptors.addAll([
      ResponseInterceptor(),
      ErrorInterceptor(),
      LogInterceptor(),
    ]);
    return _dio;
  }
}
