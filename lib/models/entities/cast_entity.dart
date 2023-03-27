import 'package:json_annotation/json_annotation.dart';

part 'cast_entity.g.dart';

@JsonSerializable()
class CastEntity {
  @JsonKey()
  bool? adult;

  @JsonKey()
  int? gender;

  @JsonKey()
  int? id;

  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @JsonKey()
  String? name;

  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey()
  double? popularity;

  @JsonKey(name: 'profile_path')
  String? profilePath;

  @JsonKey(name: 'cast_id')
  int? castId;

  @JsonKey()
  String? character;

  @JsonKey(name: 'credit_id')
  String? creditId;

  @JsonKey()
  int? order;

  CastEntity({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory CastEntity.fromJson(Map<String, dynamic> json) =>
      _$CastEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CastEntityToJson(this);
}
