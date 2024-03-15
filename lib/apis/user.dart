import 'package:mfa/models/api_res/api_res.dart';
import 'package:mfa/models/user_res/user_res.dart';
import 'package:mfa/models/user_req/user_req.dart';
import 'package:mfa/utils/dio_service.dart';

Future<User> loginByPassword(UserReq params) async {
  final ApiResponse<User> apiResponse = await dioService.postRequest<User>(
    '',
    params.toJson(), //这里不用实例化是因为params已经实例化了
    (data) => User.fromJson(data),
  );
  return apiResponse.data;
}
