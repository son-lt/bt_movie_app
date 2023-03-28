import 'package:bt_movie_app/models/entities/cast_list_entity.dart';
import 'package:bt_movie_app/models/responses/data_response.dart';
import 'package:bt_movie_app/network/api_client.dart';

abstract class CastRepository {
  Future<DataResponse<CastListEntity>?> getCastList(int id);
}

class CastRepositoryImpl extends CastRepository {
  ApiClient apiClient;

  CastRepositoryImpl({required this.apiClient});

  @override
  Future<DataResponse<CastListEntity>?> getCastList(int id) async {
    final result = await apiClient.getCastList(id);
    return result;
  }
}
