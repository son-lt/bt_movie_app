import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'most_popular_state.dart';

class MostPopularCubit extends Cubit<MostPopularState> {
  MostPopularCubit() : super(const MostPopularState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final result = await ApiClient.getMovieList(type: CategoryType.popular);
      if (result != null) {
        emit(state.copyWith(loadStatus: LoadStatus.success, data: result));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }

  void setCurrentPage({required int page}) {
    emit(state.copyWith(currentPage: page));
  }

  void getMore() {
    emit(state.copyWith(listLength: state.listLength + AppConfigs.listLength));
  }
}
