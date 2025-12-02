// Mocks for Dio and related classes used in network tests
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockResponse<T> extends Mock implements Response<T> {}

class MockRequestOptions extends Mock implements RequestOptions {}

class MockDioException extends Mock implements DioException {}
