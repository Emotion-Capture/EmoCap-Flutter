// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_api_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseEntity _$SignupResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SignupResponseEntity(
      id: json['id'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      nickname: json['nickname'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      friends: (json['friends'] as List<dynamic>)
          .map((e) => MyUserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$SignupResponseEntityToJson(
        SignupResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'nickname': instance.nickname,
      'role': _$RoleEnumMap[instance.role]!,
      'friends': instance.friends,
    };

const _$RoleEnumMap = {
  Role.ADMIN: 'ADMIN',
  Role.USER: 'USER',
  Role.GUEST: 'GUEST',
};

MyCommonResponseEntity _$MyCommonResponseEntityFromJson(
        Map<String, dynamic> json) =>
    MyCommonResponseEntity(
      status: json['status'] as int,
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$MyCommonResponseEntityToJson(
        MyCommonResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

SigninResponseEntity _$SigninResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SigninResponseEntity(
      status: json['status'] as int,
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'],
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SigninResponseEntityToJson(
        SigninResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
    };

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      nickname: json['nickname'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'password': instance.password,
    };

SigninRequest _$SigninRequestFromJson(Map<String, dynamic> json) =>
    SigninRequest(
      nickname: json['nickname'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SigninRequestToJson(SigninRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'password': instance.password,
    };

MyUserEntity _$MyUserEntityFromJson(Map<String, dynamic> json) => MyUserEntity(
      id: json['id'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      nickname: json['nickname'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

Map<String, dynamic> _$MyUserEntityToJson(MyUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'nickname': instance.nickname,
      'role': _$RoleEnumMap[instance.role]!,
    };
