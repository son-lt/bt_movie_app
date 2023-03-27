import 'package:bt_movie_app/models/entities/cast_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast_list_entity.g.dart';

@JsonSerializable()
class CastListEntity {
  @JsonKey()
  int? id;

  @JsonKey()
  List<CastEntity>? cast;

  @JsonKey()
  List<Crew>? crew;

  CastListEntity({
    this.id,
    this.cast,
    this.crew,
  });

  factory CastListEntity.fromJson(Map<String, dynamic> json) =>
      _$CastListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CastListEntityToJson(this);
}

@JsonSerializable()
class Crew {
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

  @JsonKey(name: 'credit_id')
  String? creditId;

  @JsonKey()
  String? department;

  @JsonKey()
  String? job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) =>
      _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
