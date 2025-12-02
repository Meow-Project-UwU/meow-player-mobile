import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loveappcount/common/network/interceptor/auth_interceptor.dart';

void main() {
  group('AuthInterceptor', () {
    test('adds Authorization header when token present', () {
      final interceptor = AuthInterceptor();
      interceptor.updateToken('abc123');

      final options = RequestOptions(path: '/');
      final handler = RequestInterceptorHandler();

      // Should not throw
      interceptor.onRequest(options, handler);

      expect(options.headers['Authorization'], 'Bearer abc123');
    });

    test('does not add Authorization header when token null', () {
      final interceptor = AuthInterceptor();

      final options = RequestOptions(path: '/');
      final handler = RequestInterceptorHandler();

      interceptor.onRequest(options, handler);

      expect(options.headers['Authorization'], isNull);
    });
  });
}
