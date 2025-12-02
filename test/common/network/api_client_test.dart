import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loveappcount/common/network/api_client.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mock_dio.dart';

void main() {
  group('ApiClient', () {
    late MockDio mockDio;
    late ApiClient client;

    setUp(() {
      mockDio = MockDio();
      client = ApiClient(mockDio);
    });

    test('get returns success when dio responds', () async {
      final response = Response(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: 200,
        data: {'value': 1},
      );

      when(
        () => mockDio.get('/test', queryParameters: null),
      ).thenAnswer((_) async => response);

      final res = await client.get('/test');

      expect(res.isSuccess, isTrue);
      expect(res.data, {'value': 1});
    });

    test('get returns failure when dio throws DioException', () async {
      final requestOptions = RequestOptions(path: '/err');
      final dioEx = DioException(
        requestOptions: requestOptions,
        message: 'err',
      );

      when(() => mockDio.get('/err', queryParameters: null)).thenThrow(dioEx);

      final res = await client.get('/err');

      expect(res.isSuccess, isFalse);
      expect(res.error, isNotNull);
    });

    test('post returns success when dio responds', () async {
      final response = Response(
        requestOptions: RequestOptions(path: '/post'),
        statusCode: 201,
        data: {'ok': true},
      );

      when(
        () => mockDio.post('/post', data: {'a': 1}, queryParameters: null),
      ).thenAnswer((_) async => response);

      final res = await client.post('/post', data: {'a': 1});

      expect(res.isSuccess, isTrue);
      expect(res.data, {'ok': true});
    });

    test('post returns failure when dio throws', () async {
      final requestOptions = RequestOptions(path: '/perr');
      final dioEx = DioException(
        requestOptions: requestOptions,
        message: 'post err',
      );

      when(
        () => mockDio.post('/perr', data: {'a': 1}, queryParameters: null),
      ).thenThrow(dioEx);

      final res = await client.post('/perr', data: {'a': 1});

      expect(res.isSuccess, isFalse);
      expect(res.error, isNotNull);
    });
  });
}
