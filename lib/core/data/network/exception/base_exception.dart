abstract class BaseException implements Exception {
  const BaseException({
    required this.message,
    this.code,
    this.statusCode,
  });

  final String message;
  final String? code;
  final int? statusCode;
}
