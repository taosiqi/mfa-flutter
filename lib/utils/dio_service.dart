import 'package:dio/dio.dart';
import 'package:mfa/models/api_response/api_response.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  late Dio _dio;

  factory DioService() {
    return _instance;
  }

  DioService._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://mfacode.cn/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    initializeInterceptors();
  }

  Future<ApiResponse<T>> getRequest<T>(
    String endpoint,
    T Function(dynamic) fromJsonT,
  ) async {
    try {
      final response = await _dio.get(endpoint);
      return ApiResponse.fromResponse(response, fromJsonT);
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  // 定义一个泛型方法，用于执行POST请求并解析ApiResponse
  Future<T> postRequest<T>(
    String endpoint,
    Map<String, dynamic> data,
    T Function(dynamic) fromJsonT,
  ) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      // String jsonString = json.encode(response.data);
      // debugPrint(jsonString);
      return ApiResponse.fromResponse(response, fromJsonT).data;
    } on DioException catch (e) {
      throw Exception('Failed to post data: ${e.message}');
    }
  }

  void initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioException e, handler) {
      return handler.next(e);
    }));
  }
}

final DioService dioService = DioService();
