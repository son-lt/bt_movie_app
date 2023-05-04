import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_view_model.dart';
import 'package:bt_movie_app/ui/widgets/app_page_view.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_item.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostPopularView extends StatefulWidget {
  const MostPopularView({super.key});

  @override
  State<MostPopularView> createState() => _MostPopularViewState();
}

class _MostPopularViewState extends State<MostPopularView> {
  late PageController _pageController;
  late final MostPopularViewModel provider;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
    provider = context.read<MostPopularViewModel>();
    provider.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MostPopularViewModel>(
      builder: (context, value, child) {
        if (value.loadStatus == LoadStatus.loading) {
          return AppShimmer(
            height: MediaQuery.of(context).size.height * 1 / 6,
            cornerRadius: 30,
            margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
          );
        } else if (value.loadStatus == LoadStatus.failure) {
          return AppErrorView(
            height: MediaQuery.of(context).size.height * 1 / 6,
            margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
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
              return MostPopularItem(
                title: value.data?.results?[index].title ?? '',
                score: value.data?.results?[index].voteAverage
                        ?.toStringAsFixed(1) ??
                    '',
                src: value.data?.results?[index].backdropPath ?? '',
                isCenter: isCenter,
                id: value.data?.results?[index].id ?? 0,
              );
            },
            length: value.listLength,
            heightScaleFactor: 1 / 6,
          );
        }
      },
    );
  }
}
