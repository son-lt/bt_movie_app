import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_state.dart';
import 'package:get/get.dart';

class MostPopularLogic extends GetxController {
  final state = MostPopularState();

  Future<void> loadInitialData() async {
    state.loadStatus.value = LoadStatus.loading;
    try {
      final result = await ApiClient.getMovieList(type: CategoryType.popular);
      if (result != null) {
        state.loadStatus.value = LoadStatus.success;
        state.data.value = result;
      }
    } catch (e) {
      state.loadStatus.value = LoadStatus.failure;
    }
  }

  void setCurrentPage({required int page}) {
    state.currentPage.value = page;
  }

  void getMore() {
    state.listLength.value += AppConfigs.listLength;
  }
}
