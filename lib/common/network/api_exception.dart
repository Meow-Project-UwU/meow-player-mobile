import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? status;

  ApiException({required this.message, this.status});

  factory ApiException.from(dynamic error) {
    if (error is DioException) {
      final status = error.response?.statusCode;
      final msg =
          error.response?.data["message"]?.toString() ??
          error.message ??
          "Unknown error";

      return ApiException(message: msg, status: status);
    }

    return ApiException(message: error.toString());
  }

  @override
  String toString() => "ApiException($status): $message";
}
