import 'package:emo_cap_flutter/models/security/security_user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common_response_entity.dart';
import '../user_entity.dart';

part 'security_api_entity.g.dart';

@JsonSerializable()
class SignupResponseEntity extends SecurityUserEntity {
  SignupResponseEntity({
    required super.id,
    super.createdAt,
    super.updatedAt,
    required super.nickname,
    required super.role,
    required super.friends,
    required super.status,
    required super.success,
    required super.message,
    super.data,
  });

  factory SignupResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseEntityToJson(this);
}

@JsonSerializable()
class MyCommonResponseEntity {
  @JsonKey(name: "status")
  late int status;

  @JsonKey(name: "success")
  final bool success;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "data")
  dynamic data;

  MyCommonResponseEntity({
    required this.status,
    required this.success,
    required this.message,
    this.data,
  });
}

@JsonSerializable()
class SigninResponseEntity extends CommonResponseEntity {
  @JsonKey(name: "token")
  final String? token;

  SigninResponseEntity(
      {required super.status,
      required super.success,
      required super.message,
      super.data,
      this.token});
  factory SigninResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseEntityToJson(this);
}

@JsonSerializable()
class SignupRequest {
  @JsonKey(name: "nickname")
  final String nickname;

  @JsonKey(name: "password")
  final String password;

  SignupRequest({
    required this.nickname,
    required this.password,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

@JsonSerializable()
class SigninRequest {
  @JsonKey(name: "nickname")
  final String nickname;

  @JsonKey(name: "password")
  final String password;

  SigninRequest({
    required this.nickname,
    required this.password,
  });

  factory SigninRequest.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}

@JsonSerializable()
class MyUserEntity {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @JsonKey(name: "nickname")
  final String nickname;

  @JsonKey(name: "role")
  final Role role;

  MyUserEntity({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.nickname,
    required this.role,
  });

  factory MyUserEntity.fromJson(Map<String, dynamic> json) =>
      _$MyUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MyUserEntityToJson(this);
}
