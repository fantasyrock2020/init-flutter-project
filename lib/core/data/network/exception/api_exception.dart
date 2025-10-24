import 'package:dio/dio.dart';

import 'base_exception.dart';

class ApiException extends BaseException {
  const ApiException({
    required super.message,
    super.code,
    super.statusCode,
  });

  factory ApiException.fromDioException(DioException dioException) {
    String message = 'Đã có lỗi xảy ra';
    String? code;
    final int? statusCode = dioException.response?.statusCode;

    if (dioException.response?.data != null) {
      final dynamic data = dioException.response!.data;
      if (data is Map<String, dynamic>) {
        message = data['message'] ?? message;
        code = data['code'];
      }
    } else {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          message = 'Kết nối bị timeout';
          break;
        case DioExceptionType.connectionError:
          message = 'Không thể kết nối đến server';
          break;
        case DioExceptionType.badResponse:
          message = 'Lỗi không xác định';
          break;
        case DioExceptionType.cancel:
          message = 'Request bị hủy';
          break;
        case DioExceptionType.unknown:
          message = 'Lỗi không xác định';
          break;
        case DioExceptionType.badCertificate:
          message = 'Lỗi chứng chỉ SSL';
          break;
      }
    }

    return ApiException(
      message: message,
      code: code,
      statusCode: statusCode,
    );
  }
}
