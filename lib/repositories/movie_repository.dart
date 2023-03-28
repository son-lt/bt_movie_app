import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/responses/data_response.dart';
import 'package:bt_movie_app/network/api_client.dart';

abstract class MovieRepository {
  Future<DataResponse<MovieListEntity>?> getMovieList(
    CategoryType type, {
    int page = 1,
  });

  Future<DataResponse<MovieEntity>?> getDetailMovie(int id);
}

class MovieRepositoryImpl extends MovieRepository {
  ApiClient apiClient;

  MovieRepositoryImpl({required this.apiClient});

  @override
  Future<DataResponse<MovieEntity>?> getDetailMovie(int id) async {
    final result = await apiClient.getDetail(id);
    return result;
  }

  @override
  Future<DataResponse<MovieListEntity>?> getMovieList(
    CategoryType type, {
    int page = 1,
  }) async {
    switch (type) {
      case CategoryType.popular:
        return await apiClient.getMostPopularList(page);
      case CategoryType.upcoming:
        return await apiClient.getUpcomingReleasesList(page);
    }
  }
}
