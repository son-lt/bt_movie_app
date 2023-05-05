import 'package:bt_movie_app/models/entities/cast_list_entity.dart';
import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:get/get.dart';

class DetailState {
  final Rx<LoadStatus> loadStatus = LoadStatus.initial.obs;
  final Rx<MovieEntity> movieData = MovieEntity().obs;
  final Rx<CastListEntity> castListData = CastListEntity().obs;
  final Rx<int> listLength = 5.obs;
  final Rx<bool> isShow = false.obs;

  DetailState();
}
