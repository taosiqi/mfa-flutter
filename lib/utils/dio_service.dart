import 'package:dio/dio.dart';
import 'package:mfa/models/api_res/api_res.dart';
import 'package:mfa/providers/user.dart';
import 'package:mfa/routes/routes.dart';
import 'package:oktoast/oktoast.dart';

class DioService {
  static final DioService _instance = DioService._internal(UserProvider());

  late Dio _dio;
  final UserProvider userProvider;

  factory DioService() {
    return _instance;
  }

  DioService._internal(this.userProvider) {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://mfacode.cn/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    initializeInterceptors();
  }

  Future<ApiResponse<T>> getRequest<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    required T Function(dynamic) fromJsonT,
  }) async {
    final response = await _dio.get(endpoint, queryParameters: data);
    return ApiResponse.fromResponse(response, fromJsonT);
  }

  Future<ApiResponse<T>> postRequest<T>(
    String endpoint,
    Map<String, dynamic> data,
    T Function(dynamic) fromJsonT,
  ) async {
    final response = await _dio.post(endpoint, data: data);
    return ApiResponse.fromResponse(response, fromJsonT);
  }

  Future<ApiResponse<T>> putRequest<T>(
    String endpoint,
    Map<String, dynamic> data,
    T Function(dynamic) fromJsonT,
  ) async {
    final response = await _dio.put(endpoint, data: data);
    return ApiResponse.fromResponse(response, fromJsonT);
  }

  Future<ApiResponse<T>> deleteRequest<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    required T Function(dynamic) fromJsonT,
  }) async {
    final response = await _dio.delete(endpoint, queryParameters: data);
    return ApiResponse.fromResponse(response, fromJsonT);
  }

  void initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String? token = userProvider.token;
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode != 200) {
          throw Exception(response.statusCode);
        }
        final jsonData = response.data;
        if (jsonData['code'] != 200) {
          if (jsonData['code'] == 401) {
            router.go('/login');
          }
          throw Exception('${jsonData['msg']}');
        }
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        String errorMessage = e.error?.toString() ?? 'error';
        if (e.response != null) {
          errorMessage += ' - ${e.response!.statusCode}';
        }
        showToast(errorMessage);
        return handler.next(e);
      },
    ));
  }
}

final DioService dioService = DioService();
