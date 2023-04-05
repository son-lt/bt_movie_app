import 'dart:convert';

import 'package:bt_movie_app/models/entities/cast_list_entity.dart';
import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/enums/info_type.dart';
import 'package:bt_movie_app/utils/api_utils.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<MovieListEntity?> getMovieList(
      {required CategoryType type, int page = 1}) async {
    final response = await http.get(
      Uri.parse(
        ApiUtils.getApiMovieList(
          type: type,
          page: page,
        ),
      ),
    );
    if (response.statusCode == 200) {
      return MovieListEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  static Future<MovieEntity?> getMovieDetail(int id) async {
    final response = await http.get(
      Uri.parse(
        ApiUtils.getApiMovieInfo(
          type: InfoType.detail,
          id: id,
        ),
      ),
    );
    if (response.statusCode == 200) {
      return MovieEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  static Future<CastListEntity?> getCastList(int id) async {
    final response = await http.get(
      Uri.parse(
        ApiUtils.getApiMovieInfo(
          type: InfoType.cast,
          id: id,
        ),
      ),
    );
    if (response.statusCode == 200) {
      return CastListEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
