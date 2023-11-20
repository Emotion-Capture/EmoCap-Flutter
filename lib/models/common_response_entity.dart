import 'package:json_annotation/json_annotation.dart';

class CommonResponseEntity {
  @JsonKey(name: "status")
  late int status;

  @JsonKey(name: "success")
  final bool success;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "data")
  dynamic data;

  CommonResponseEntity({
    required this.status,
    required this.success,
    required this.message,
    this.data,
  });
}
