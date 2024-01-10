// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      openId: json['open_id'] as String? ?? '',
      password: json['password'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      profilePictureUrl: json['profile_picture_url'] as String? ?? '',
      isDeleted: json['is_deleted'] as bool? ?? false,
      createdAt: json['created_at'] as int? ?? 0,
      updatedAt: json['updated_at'] as int? ?? 0,
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'open_id': instance.openId,
      'password': instance.password,
      'gender': instance.gender,
      'phone': instance.phone,
      'profile_picture_url': instance.profilePictureUrl,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'token': instance.token,
    };
