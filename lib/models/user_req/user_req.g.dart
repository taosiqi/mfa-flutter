// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReq _$UserReqFromJson(Map<String, dynamic> json) => UserReq(
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      action: json['action'] as String? ?? '',
    );

Map<String, dynamic> _$UserReqToJson(UserReq instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'action': instance.action,
    };
