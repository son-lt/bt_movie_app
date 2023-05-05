import 'package:bt_movie_app/models/entities/cast_list_entity.dart';
import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(const DetailState());

  Future<void> loadInitialData(int id) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final movieResult = await ApiClient.getMovieDetail(id);
      final castListResult = await ApiClient.getCastList(id);
      if (movieResult != null && castListResult != null) {
        emit(state.copyWith(
          loadStatus: LoadStatus.success,
          movieData: movieResult,
          castListData: castListResult,
        ));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
    }
  }

  void showMoreCast() {
    emit(state.copyWith(listLength: state.castListData?.cast?.length ?? 0));
  }

  void setIsShow() {
    emit(state.copyWith(isShow: !state.isShow));
  }
}
