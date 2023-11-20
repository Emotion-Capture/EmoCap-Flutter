import 'package:json_annotation/json_annotation.dart';

class UserEntity {
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
  List<UserEntity> friends;

  UserEntity({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.nickname,
    required this.role,
    required this.friends,
  });
}

enum Role { ADMIN, USER, GUEST }
