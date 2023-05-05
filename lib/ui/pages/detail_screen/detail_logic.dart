import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_state.dart';
import 'package:get/get.dart';

class DetailLogic extends GetxController {
  final state = DetailState();

  Future<void> loadInitialData(int id) async {
    state.loadStatus.value = LoadStatus.loading;
    try {
      final movieResult = await ApiClient.getMovieDetail(id);
      final castListResult = await ApiClient.getCastList(id);
      if (movieResult != null && castListResult != null) {
        state.loadStatus.value = LoadStatus.success;
        state.movieData.value = movieResult;
        state.castListData.value = castListResult;
      }
    } catch (e) {
      state.loadStatus.value = LoadStatus.failure;
    }
  }

  void showMoreCast() {
    state.listLength.value = state.castListData.value.cast?.length ?? 0;
  }

  void setIsShow() {
    state.isShow.value = !state.isShow.value;
  }
}
