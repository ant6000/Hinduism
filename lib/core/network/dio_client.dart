import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  late final Dio _dio;
  final Map<String, CancelToken> _cancelTokens = {};

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'}
    ));

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      request: true,
      error: true,
      requestHeader: true,
      responseHeader: true
    ));
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? cancelToken,
  }) async {
    if (cancelToken != null) {
      _cancelTokens[cancelToken]?.cancel();
      _cancelTokens[cancelToken] = CancelToken();
    }

    return await _dio.get<T>(
      path,
      // queryParameters: queryParameters,
      // cancelToken: cancelToken != null ? _cancelTokens[cancelToken] : null,
    );
  }

  void cancelRequest(String token) {
    _cancelTokens[token]?.cancel();
    _cancelTokens.remove(token);
  }
}

final dioClientProvider = Provider<DioClient>((ref) => DioClient());
