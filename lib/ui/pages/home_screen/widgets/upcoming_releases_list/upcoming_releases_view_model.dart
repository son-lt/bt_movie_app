import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:flutter/material.dart';

class UpcomingReleasesViewModel extends ChangeNotifier {
  int listLength = AppConfigs.listLength;
  int currentPage = 0;
  MovieListEntity? data;
  LoadStatus loadStatus = LoadStatus.initial;

  Future<void> loadInitialData() async {
    loadStatus = LoadStatus.loading;
    try {
      final result = await ApiClient.getMovieList(type: CategoryType.upcoming);
      if (result != null) {
        loadStatus = LoadStatus.success;
        data = result;
        notifyListeners();
      }
    } catch (e) {
      loadStatus = LoadStatus.failure;
      notifyListeners();
    }
  }

  void setCurrentPage({required int page}) {
    currentPage = page;
    notifyListeners();
  }

  void getMore() {
    listLength += AppConfigs.listLength;
    notifyListeners();
  }
}
