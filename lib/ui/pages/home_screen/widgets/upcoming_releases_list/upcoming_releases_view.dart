import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/upcoming_releases_list/upcoming_releases_logic.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/upcoming_releases_list/upcoming_releases_state.dart';
import 'package:bt_movie_app/ui/widgets/app_page_view.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_page.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/inactive_overlay.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpcomingReleasesView extends StatefulWidget {
  const UpcomingReleasesView({super.key});

  @override
  State<UpcomingReleasesView> createState() =>
      _UpcomingReleasesViewState();
}

class _UpcomingReleasesViewState extends State<UpcomingReleasesView> {
  late PageController _pageController;
  final UpcomingReleasesLogic logic = Get.put(UpcomingReleasesLogic());
  final UpcomingReleasesState state = Get.find<UpcomingReleasesLogic>().state;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.4);
    logic.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (state.loadStatus.value == LoadStatus.loading) {
          return AppShimmer(
            height: 216.h,
            margin: const EdgeInsets.symmetric(horizontal: 144).r,
            cornerRadius: 30,
          );
        } else if (state.loadStatus.value == LoadStatus.failure) {
          return AppErrorView(
            height: 216.h,
            margin: const EdgeInsets.symmetric(horizontal: 144).r,
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
              return upcomingReleaseItem(
                src: state.data.value.results?[index].posterPath ?? '',
                isCenter: isCenter,
                id: state.data.value.results?[index].id ?? 0,
              );
            },
            length: state.listLength.value,
            height: 256.h,
          );
        }
      },
    );
  }

  Widget upcomingReleaseItem({
    required String src,
    required bool isCenter,
    required int id,
  }) {
    return InkWell(
      onTap: isCenter
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    args: DetailPageArgs(id: id),
                  ),
                ),
              );
            }
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30).r,
          image: DecorationImage(
            image: NetworkImage(AppConfigs.baseImageURL + src),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            if (!isCenter) const InactiveOverlay(),
          ],
        ),
      ),
    );
  }
}
