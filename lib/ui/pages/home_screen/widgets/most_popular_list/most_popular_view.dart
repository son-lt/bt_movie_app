import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_logic.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_state.dart';
import 'package:bt_movie_app/ui/widgets/app_page_view.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_item.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopularView extends StatefulWidget {
  const MostPopularView({super.key});

  @override
  State<MostPopularView> createState() => _MostPopularViewState();
}

class _MostPopularViewState extends State<MostPopularView> {
  late PageController _pageController;
  final MostPopularLogic logic = Get.put(MostPopularLogic());
  final MostPopularState state = Get.find<MostPopularLogic>().state;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
    logic.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (state.loadStatus.value == LoadStatus.loading) {
          return AppShimmer(
            height: 140.h,
            cornerRadius: 30.r,
            margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16).r,
          );
        } else if (state.loadStatus.value == LoadStatus.failure) {
          return AppErrorView(
            height: 140.h,
            margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16).r,
            borderRadius: 30.r,
            onTap: () async {
              await logic.loadInitialData();
            },
          );
        } else {
          return AppPageView(
            pageController: _pageController,
            onPageChange: (value) {
              logic.setCurrentPage(page: value);
            },
            currentPage: state.currentPage.value,
            itemBuilder: (BuildContext context, int index) {
              bool isCenter = state.currentPage.value == index;
              return MostPopularItem(
                title: state.data.value.results?[index].title ?? '',
                score: state.data.value.results?[index].voteAverage
                        ?.toStringAsFixed(1) ??
                    '',
                src: state.data.value.results?[index].backdropPath ?? '',
                isCenter: isCenter,
                id: state.data.value.results?[index].id ?? 0,
              );
            },
            length: value.listLength.value,
            height: 180.h,
          );
        }
      },
    );
  }
}
