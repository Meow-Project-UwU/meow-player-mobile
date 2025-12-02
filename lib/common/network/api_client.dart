import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_exception.dart';
import 'api_result.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);

  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final res = await _dio.get(path, queryParameters: query);
      return ApiResult.success(res.data);
    } catch (e) {
      return ApiResult.failure(ApiException.from(e));
    }
  }

  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final res = await _dio.post(path, data: data, queryParameters: query);
      return ApiResult.success(res.data);
    } catch (e) {
      return ApiResult.failure(ApiException.from(e));
    }
  }
}
