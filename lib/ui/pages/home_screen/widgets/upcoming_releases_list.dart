import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:bt_movie_app/ui/commons/app_page_view.dart';
import 'package:bt_movie_app/ui/commons/inactive_overlay.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_screen.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

class UpcomingReleasesList extends StatefulWidget {
  const UpcomingReleasesList({super.key});

  @override
  State<UpcomingReleasesList> createState() => _UpcomingReleasesListState();
}

class _UpcomingReleasesListState extends State<UpcomingReleasesList> {
  int listLength = AppConfigs.listLength;
  late PageController _pageController;
  int currentPage = 0;
  LoadStatus loadStatus = LoadStatus.initial;
  MovieListEntity? data;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.4);
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    setState(() {
      loadStatus = LoadStatus.loading;
    });
    try {
      final result = await ApiClient.getMovieList(type: CategoryType.upcoming);
      if (result != null) {
        setState(() {
          loadStatus = LoadStatus.success;
          data = result;
        });
      }
    } catch (e) {
      setState(() {
        loadStatus = LoadStatus.failure;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loadStatus == LoadStatus.loading) {
      return AppShimmer(
        height: MediaQuery.of(context).size.height * 1 / 4,
        margin: const EdgeInsets.symmetric(horizontal: 144),
        cornerRadius: 30,
      );
    } else if (loadStatus == LoadStatus.failure) {
      return AppErrorView(
        height: MediaQuery.of(context).size.height * 1 / 4,
        margin: const EdgeInsets.symmetric(horizontal: 144),
        borderRadius: 30,
        onTap: () async {
          await loadInitialData();
        },
      );
    } else {
      return AppPageView(
        pageController: _pageController,
        onPageChange: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentPage: currentPage,
        itemBuilder: (BuildContext context, int index) {
          bool isCenter = currentPage == index;
          return upcomingReleaseItem(
            src: data?.results?[index].posterPath ?? '',
            isCenter: isCenter,
            id: data?.results?[index].id ?? 0,
          );
        },
        length: listLength,
        heightScaleFactor: 1 / 4,
      );
    }
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
                  builder: (context) => DetailScreen(id: id),
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
