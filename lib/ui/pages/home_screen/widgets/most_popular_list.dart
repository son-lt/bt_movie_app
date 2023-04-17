import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/movie_list_entity.dart';
import 'package:bt_movie_app/models/enums/category_type.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:bt_movie_app/ui/commons/app_page_view.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_item.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';

class MostPopularList extends StatefulWidget {
  const MostPopularList({super.key});

  @override
  State<MostPopularList> createState() => _MostPopularListState();
}

class _MostPopularListState extends State<MostPopularList> {
  int listLength = AppConfigs.listLength;
  late PageController _pageController;
  int currentPage = 0;
  MovieListEntity? data;
  LoadStatus loadStatus = LoadStatus.initial;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    setState(() {
      loadStatus = LoadStatus.loading;
    });
    try {
      final result = await ApiClient.getMovieList(type: CategoryType.popular) ;
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
        height: MediaQuery.of(context).size.height * 1 / 6,
        cornerRadius: 30,
        margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
      );
    } else if (loadStatus == LoadStatus.failure) {
      return AppErrorView(
        height: MediaQuery.of(context).size.height * 1 / 6,
        margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
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
          return MostPopularItem(
            title: data?.results?[index].title ?? '',
            score: data?.results?[index].voteAverage?.toStringAsFixed(1) ?? '',
            src: data?.results?[index].backdropPath ?? '',
            isCenter: isCenter,
            id: data?.results?[index].id ?? 0,
          );
        },
        length: listLength,
        heightScaleFactor: 1 / 6,
      );
    }
  }
}
