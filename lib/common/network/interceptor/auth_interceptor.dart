import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  // Inject token storage or usecase vào đây
  String? get token => _cachedToken;
  String? _cachedToken;

  void updateToken(String newToken) {
    _cachedToken = newToken;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }
}
