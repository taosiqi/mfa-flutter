import 'package:json_annotation/json_annotation.dart';

part 'user_req.g.dart';

@JsonSerializable(explicitToJson: true)
class UserReq {
  UserReq(
      {required this.username,
      required this.password,
      this.action = 'loginByPassword'});

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "password", defaultValue: "")
  String password;

  @JsonKey(name: "action", defaultValue: "loginByPassword")
  String action;

  factory UserReq.fromJson(Map<String, dynamic> json) =>
      _$UserReqFromJson(json);

  Map<String, dynamic> toJson() => _$UserReqToJson(this);
}
