import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User(
      {required this.username,
      required this.email,
      required this.openId,
      required this.password,
      required this.gender,
      required this.phone,
      required this.profilePictureUrl,
      required this.isDeleted,
      required this.createdAt,
      required this.updatedAt,
      required this.token});

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "email", defaultValue: "")
  String email;

  @JsonKey(name: "open_id", defaultValue: "")
  String openId;

  @JsonKey(name: "password", defaultValue: "")
  String password;

  @JsonKey(name: "gender", defaultValue: "")
  String gender;

  @JsonKey(name: "phone", defaultValue: "")
  String phone;

  @JsonKey(name: "profile_picture_url", defaultValue: "")
  String profilePictureUrl;

  @JsonKey(name: "is_deleted", defaultValue: false)
  bool isDeleted;

  @JsonKey(name: "created_at", defaultValue: 0)
  int createdAt;

  @JsonKey(name: "updated_at", defaultValue: 0)
  int updatedAt;

  @JsonKey(name: "token", defaultValue: "")
  String token;


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}


