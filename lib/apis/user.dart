import 'package:mfa/models/api_response/api_response.dart';
import 'package:mfa/models/user/user.dart';
import 'package:mfa/utils/dio_service.dart';

Future<User> loginByPassword(String username, String password) async {
  final ApiResponse<User> apiResponse = await dioService.postRequest<User>(
    '',
    {'action': "loginByPassword", 'username': username, 'password': password},
    (data) => User.fromJson(data),
  );
  return apiResponse.data;
}
