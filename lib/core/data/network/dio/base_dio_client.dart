import 'package:dio/dio.dart';

import 'constants/network_const.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

class BaseDioClient {
  BaseDioClient({
    required String baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(
          milliseconds: connectTimeout ?? NetworkConst.connectTimeout,
        ),
        receiveTimeout: Duration(
          milliseconds: receiveTimeout ?? NetworkConst.receiveTimeout,
        ),
        headers: headers ?? <String, dynamic>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll(<Interceptor>[
      AuthInterceptor(),
      LoggingInterceptor(
        requestBody: true,
        requestHeader: true,
      ),
    ]);

    // Add custom interceptors if provided
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }
  late final Dio _dio;

  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void setHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  void removeHeader(String key) {
    _dio.options.headers.remove(key);
  }

  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  void updateBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  Dio get dio => _dio;
}
