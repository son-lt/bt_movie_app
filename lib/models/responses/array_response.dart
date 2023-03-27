import 'package:json_annotation/json_annotation.dart';

part 'array_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ArrayResponse<T> {
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey()
  final bool? success;
  @JsonKey()
  final List<T>? data;

  ArrayResponse({
    this.statusMessage,
    this.statusCode,
    this.success,
    this.data,
  });

  factory ArrayResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ArrayResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ArrayResponseToJson(this, toJsonT);
}
