import 'package:emo_cap_flutter/models/security/security_api_entity.dart';
import 'package:emo_cap_flutter/models/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common_response_entity.dart';

class SecurityUserEntity extends CommonResponseEntity {
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

  @JsonKey(name: "friends")
  List<MyUserEntity> friends;

  SecurityUserEntity({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.nickname,
    required this.role,
    required this.friends,
    required super.status,
    required super.success,
    required super.message,
    super.data,
  });
}
