import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/enums/info_type.dart';

class ApiUtils {
  static String getApiMovieList(
      {required CategoryType type, required int page}) {
    switch (type) {
      case CategoryType.popular:
        return '${AppConfigs.baseUrl}/popular?${AppConfigs.apiKey}&page=$page';
      case CategoryType.upcoming:
        return '${AppConfigs.baseUrl}/upcoming?${AppConfigs.apiKey}&page=$page';
    }
  }

  static String getApiMovieInfo({required InfoType type, required int id}) {
    switch (type) {
      case InfoType.detail:
        return '${AppConfigs.baseUrl}/$id?${AppConfigs.apiKey}';
      case InfoType.cast:
        return '${AppConfigs.baseUrl}/$id/credits?${AppConfigs.apiKey}';
    }
  }
}
