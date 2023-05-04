import 'package:bt_movie_app/ui/pages/home_screen/home_state.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  final state = HomeState();

  void setCurrentPage({required int page}) {
    state.currentPage.value = page;
  }
}
