import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/upcoming_releases_list/upcoming_releases_view_model.dart';
import 'package:bt_movie_app/ui/widgets/app_page_view.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_page.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/inactive_overlay.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingReleasesListView extends StatefulWidget {
  const UpcomingReleasesListView({super.key});

  @override
  State<UpcomingReleasesListView> createState() =>
      _UpcomingReleasesListViewState();
}

class _UpcomingReleasesListViewState extends State<UpcomingReleasesListView> {
  late PageController _pageController;
  late final UpcomingReleasesViewModel provider;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.4);
    provider = context.read<UpcomingReleasesViewModel>();
    provider.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingReleasesViewModel>(
      builder: (context, value, child) {
        if (value.loadStatus == LoadStatus.loading) {
          return AppShimmer(
            height: MediaQuery.of(context).size.height * 1 / 4,
            margin: const EdgeInsets.symmetric(horizontal: 144),
            cornerRadius: 30,
          );
        } else if (value.loadStatus == LoadStatus.failure) {
          return AppErrorView(
            height: MediaQuery.of(context).size.height * 1 / 4,
            margin: const EdgeInsets.symmetric(horizontal: 144),
            borderRadius: 30,
            onTap: () async {
              await provider.loadInitialData();
            },
          );
        } else {
          return AppPageView(
            pageController: _pageController,
            onPageChange: (value) {
              provider.setCurrentPage(page: value);
            },
            currentPage: value.currentPage,
            itemBuilder: (BuildContext context, int index) {
              bool isCenter = value.currentPage == index;
              return upcomingReleaseItem(
                src: value.data?.results?[index].posterPath ?? '',
                isCenter: isCenter,
                id: value.data?.results?[index].id ?? 0,
              );
            },
            length: value.listLength,
            heightScaleFactor: 1 / 4,
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
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
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
