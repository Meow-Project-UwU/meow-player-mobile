import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loveappcount/common/network/api_exception.dart';
import 'package:loveappcount/common/network/api_result.dart';

void main() {
  group('ApiResult and ApiException', () {
    test('ApiResult success sets data and isSuccess true', () {
      final result = ApiResult<int>.success(42);
      expect(result.isSuccess, isTrue);
      expect(result.data, 42);
      expect(result.error, isNull);
    });

    test('ApiResult failure sets error and isSuccess false', () {
      final error = ApiException(message: 'fail', status: 500);
      final result = ApiResult<int>.failure(error);
      expect(result.isSuccess, isFalse);
      expect(result.error, error);
      expect(result.data, isNull);
    });

    test('ApiException.from transforms non-dio error', () {
      final e = Exception('boom');
      final apiEx = ApiException.from(e);
      expect(apiEx.message, contains('Exception: boom'));
      expect(apiEx.status, isNull);
    });

    test(
      'ApiException.from transforms DioException with response data message',
      () {
        final response = Response(
          requestOptions: RequestOptions(path: '/'),
          statusCode: 400,
          data: {'message': 'bad'},
        );
        final dioEx = DioException(
          requestOptions: response.requestOptions,
          response: response,
        );

        final apiEx = ApiException.from(dioEx);
        expect(apiEx.message, 'bad');
        expect(apiEx.status, 400);
      },
    );

    test('ApiException.toString includes status and message', () {
      final apiEx = ApiException(message: 'hi', status: 201);
      expect(apiEx.toString(), contains('ApiException(201): hi'));
    });
  });
}
