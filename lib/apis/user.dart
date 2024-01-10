import 'package:mfa/models/user/user.dart';
import 'package:mfa/utils/dio_service.dart';

Future<User> loginByPassword(String username, String password) async {
  final User apiResponse = await dioService.postRequest<User>(
    '',
    {'action': "loginByPassword", 'username': username, 'password': password},
    (data) => User.fromJson(data),
  );
  return apiResponse;
}
