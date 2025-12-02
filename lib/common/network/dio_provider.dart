import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'interceptor/auth_interceptor.dart';
import 'interceptor/log_interceptor.dart';

@module
abstract class DioProvider {
  @lazySingleton
  Dio dio(AuthInterceptor auth, AppLogInterceptor log) {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://127.0.0.1:3000/api",
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.addAll([log, auth]);

    return dio;
  }
}
