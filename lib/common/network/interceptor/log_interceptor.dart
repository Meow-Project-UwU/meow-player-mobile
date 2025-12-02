import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('➡️ [REQUEST] ${options.method} ${options.uri}');
    if (options.data != null) print('Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      '⬅️ [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}',
    );
    print('Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❌ [ERROR] ${err.response?.statusCode} ${err.requestOptions.uri}');
    print('Message: ${err.message}');
    super.onError(err, handler);
  }
}
