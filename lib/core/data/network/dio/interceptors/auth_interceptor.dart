import 'dart:collection';

import 'package:dio/dio.dart';

typedef FailedRequest = (DioException, ErrorInterceptorHandler);

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  final Queue<FailedRequest> _failedRequests = Queue<FailedRequest>();

  bool _isRefreshing = false;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final SecureStorageHelper pref = getIt.get<SecureStorageHelper>();
    // final String token = await pref.read(Preferences.authToken) ?? '';
    // debugPrint('========= User access token: $token');
    // if (token.isNotEmpty) {
    //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // } else {
    //   options.headers.remove(HttpHeaders.authorizationHeader);
    // }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (isUnauthorized(err)) {
      _failedRequests.addLast((err, handler));
      if (!_isRefreshing) {
        _isRefreshing = true;
      }
    } else {
      handler.next(err);
    }
  }

  bool isUnauthorized(DioException err) {
    return err.response?.statusCode == 401 &&
        !err.requestOptions.path.contains('refresh');
  }

  // Retry failed request
  // Future<void> _retryFailedRequest(String token) async {
  //   final Dio dio = Dio();
  //   while (_failedRequests.isNotEmpty) {
  //     final FailedRequest failedRequest = _failedRequests.removeFirst();

  //     try {
  //       final RequestOptions options = failedRequest.$1.requestOptions.copyWith(
  //         headers: <String, dynamic>{
  //           ...failedRequest.$1.requestOptions.headers,
  //           HttpHeaders.authorizationHeader: 'Bearer $token',
  //         },
  //       );
  //       final Response<dynamic> response = await dio.fetch(options);
  //       failedRequest.$2.resolve(response);
  //     } on DioException catch (error) {
  //       failedRequest.$2.reject(error);
  //     } on Object catch (error, stackTrace) {
  //       failedRequest.$2.reject(
  //         DioException(
  //           requestOptions: failedRequest.$1.requestOptions,
  //           error: error,
  //           stackTrace: stackTrace,
  //         ),
  //       );
  //     }
  //   }
  //   dio.close();
  // }

  // void _cleanFailedRequest() {
  //   while (_failedRequests.isNotEmpty) {
  //     final FailedRequest element = _failedRequests.removeFirst();
  //     element.$2.reject(element.$1);
  //   }
  // }

  // Future<void> _forceLogout() async {
  //   getIt.get<AuthRepository>().clearUserCache();
  //   getIt.get<AuthRepository>().clearToken();
  // }
}
