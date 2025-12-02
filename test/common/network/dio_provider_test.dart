import 'package:flutter_test/flutter_test.dart';
import 'package:loveappcount/common/network/dio_provider.dart';
import 'package:loveappcount/common/network/interceptor/auth_interceptor.dart';
import 'package:loveappcount/common/network/interceptor/log_interceptor.dart';

void main() {
  group('DioProvider', () {
    test('dio has baseUrl, timeouts and interceptors', () {
      final auth = AuthInterceptor();
      final log = AppLogInterceptor();

      final provider = _TestDioProvider();
      final dio = provider.dio(auth, log);

      expect(dio.options.baseUrl, contains('127.0.0.1'));
      expect(dio.options.connectTimeout, isNotNull);
      expect(dio.options.receiveTimeout, isNotNull);
      expect(dio.interceptors, isNotEmpty);
      // contains our interceptors
      expect(dio.interceptors.whereType<AppLogInterceptor>(), isNotEmpty);
      expect(dio.interceptors.whereType<AuthInterceptor>(), isNotEmpty);
    });
  });
}

class _TestDioProvider extends DioProvider {}
