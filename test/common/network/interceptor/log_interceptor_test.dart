import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loveappcount/common/network/interceptor/log_interceptor.dart';

void main() {
  group('AppLogInterceptor', () {
    test('onRequest prints method and uri', () {
      final interceptor = AppLogInterceptor();
      final options = RequestOptions(
        path: '/x',
        method: 'GET',
        baseUrl: 'http://localhost',
      );
      final handler = RequestInterceptorHandler();

      final printed = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) {
          printed.add(msg);
        },
      );

      return Zone.current.fork(specification: spec).run(() {
        interceptor.onRequest(options, handler);
        expect(printed.any((s) => s.contains('[REQUEST]')), isTrue);
      });
    });

    test('onResponse prints status and uri and data', () {
      final interceptor = AppLogInterceptor();
      final reqOptions = RequestOptions(
        path: '/x',
        baseUrl: 'http://localhost',
      );
      final response = Response(
        requestOptions: reqOptions,
        statusCode: 200,
        data: {'a': 1},
      );
      final handler = _NoopResponseHandler();

      final printed = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) {
          printed.add(msg);
        },
      );

      return Zone.current.fork(specification: spec).run(() {
        interceptor.onResponse(response, handler);
        expect(printed.any((s) => s.contains('[RESPONSE]')), isTrue);
        expect(printed.any((s) => s.contains('Data:')), isTrue);
      });
    });

    test('onError prints status and message', () {
      final interceptor = AppLogInterceptor();
      final reqOptions = RequestOptions(
        path: '/x',
        baseUrl: 'http://localhost',
      );
      final resp = Response(requestOptions: reqOptions, statusCode: 500);
      final dioEx = DioException(
        requestOptions: reqOptions,
        message: 'bad',
        response: resp,
      );
      final handler = _NoopErrorHandler();

      final printed = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) {
          printed.add(msg);
        },
      );

      return Zone.current.fork(specification: spec).run(() {
        interceptor.onError(dioEx, handler);
        expect(printed.any((s) => s.contains('[ERROR]')), isTrue);
        expect(printed.any((s) => s.contains('Message:')), isTrue);
      });
    });
  });
}

class _NoopResponseHandler extends ResponseInterceptorHandler {
  @override
  void next(Response response) {
    // no-op to avoid completing futures in tests
  }

  @override
  void resolve(Response response) {
    // no-op
  }

  @override
  void reject(
    DioException error, [
    bool callFollowingErrorInterceptor = false,
  ]) {
    // no-op
  }
}

class _NoopErrorHandler extends ErrorInterceptorHandler {
  @override
  void next(DioException error) {
    // no-op
  }

  @override
  void resolve(Response response) {
    // no-op
  }

  @override
  void reject(DioException error) {
    // no-op
  }
}
