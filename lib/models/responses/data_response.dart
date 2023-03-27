import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey()
  final bool? success;
  @JsonKey()
  final T? data;

  DataResponse({
    this.statusMessage,
    this.statusCode,
    this.success,
    this.data,
  });

  factory DataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$DataResponseToJson(this, toJsonT);
}
