import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Header {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'message')
  String? message;

  Header({required this.code, required this.message});

  factory Header.fromJson(Map<dynamic, dynamic> json) => Header(
        code: json["code"],
        message: json["message"],
      );
}