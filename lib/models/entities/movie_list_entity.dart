import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_entity.g.dart';

@JsonSerializable()
class MovieListEntity {
  @JsonKey()
  Dates? dates;

  @JsonKey()
  int? page;

  @JsonKey()
  List<MovieEntity>? results;

  MovieListEntity({
    this.dates,
    this.page,
    this.results,
  });

  factory MovieListEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListEntityToJson(this);
}

@JsonSerializable()
class Dates {
  @JsonKey()
  String? maximum;

  @JsonKey()
  String? minimum;

  Dates({
    this.maximum,
    this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
