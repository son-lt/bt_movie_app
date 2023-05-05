import 'package:bt_movie_app/models/entities/cast_list_entity.dart';
import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:flutter/material.dart';

class DetailViewModel extends ChangeNotifier {
  LoadStatus loadStatus = LoadStatus.initial;
  MovieEntity? movieData;
  CastListEntity? castListData;
  int listLength = 5;
  bool isShow = false;

  DetailViewModel();

  Future<void> loadInitialData(int id) async {
    loadStatus = LoadStatus.loading;
    try {
      final movieResult = await ApiClient.getMovieDetail(id);
      final castListResult = await ApiClient.getCastList(id);
      if (movieResult != null && castListResult != null) {
        loadStatus = LoadStatus.success;
        movieData = movieResult;
        castListData = castListResult;
        notifyListeners();
      }
    } catch (e) {
      loadStatus = LoadStatus.failure;
      notifyListeners();
    }
  }

  void showMoreCast() {
    listLength = castListData?.cast?.length ?? 0;
    notifyListeners();
  }

  void setIsShow() {
    isShow = !isShow;
    notifyListeners();
  }
}
