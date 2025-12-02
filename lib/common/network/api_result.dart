import 'api_exception.dart';

class ApiResult<T> {
  final T? data;
  final ApiException? error;

  bool get isSuccess => error == null;

  ApiResult.success(this.data) : error = null;
  ApiResult.failure(this.error) : data = null;
}
