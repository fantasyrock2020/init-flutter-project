import 'package:dio/dio.dart';

import 'base_dio_client.dart';

class CustomDioClient {
  const CustomDioClient._();
  
  static BaseDioClient createCustomClient({
    required String baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    return BaseDioClient(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      interceptors: interceptors,
    );
  }
}
