import 'package:dio/dio.dart';

// 定义API响应类
class ApiResponse<T> {
  final int code;
  final String msg;
  final T data;

  ApiResponse({
    required this.code,
    required this.msg,
    required this.data,
  });

  // 解析从Dio获取的Response对象
  factory ApiResponse.fromResponse(
      Response response, T Function(dynamic) fromJsonT) {
    if (response.statusCode == 200) {
      final jsonData = response.data;
      return ApiResponse<T>(
        code: jsonData['code'],
        msg: jsonData['msg'],
        data: fromJsonT(jsonData['data']),
      );
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
