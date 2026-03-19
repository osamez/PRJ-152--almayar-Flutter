import 'package:json_annotation/json_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  final bool? success;
  final int? status;
  final String? message;
  final String? error;
  final dynamic data;

  const MessageResponse({
    this.success,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}
