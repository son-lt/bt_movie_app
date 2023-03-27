import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/cast_list_entity.dart';
import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/responses/data_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfigs.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/popular?${AppConfigs.apiKey}')
  Future<DataResponse<MovieListEntity>> getMostPopularList(
    @Query('page') int page,
  );

  @GET('/upcoming?${AppConfigs.apiKey}')
  Future<DataResponse<MovieListEntity>> getUpcomingReleasesList(
    @Query('page') int page,
  );

  @GET('/{id}?${AppConfigs.apiKey}')
  Future<DataResponse<MovieEntity>> getDetail(
    @Path('id') int id,
  );

  @GET('/{id}/credits?${AppConfigs.apiKey}')
  Future<DataResponse<CastListEntity>> getCastList(
    @Path('id') int id,
  );
}
