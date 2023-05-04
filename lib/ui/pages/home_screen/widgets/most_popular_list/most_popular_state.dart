import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:get/get.dart';

class MostPopularState {
  final Rx<int> listLength = AppConfigs.listLength.obs;
  final Rx<int> currentPage = 0.obs;
  final Rx<MovieListEntity> data = MovieListEntity().obs;
  final Rx<LoadStatus> loadStatus = LoadStatus.initial.obs;

  MostPopularState();
}