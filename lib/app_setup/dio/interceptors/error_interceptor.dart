import 'package:dio/dio.dart';

class ErrorInterceptor extends QueuedInterceptorsWrapper {
  late final Dio _dio;
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
