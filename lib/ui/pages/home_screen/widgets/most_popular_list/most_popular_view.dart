import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_cubit.dart';
import 'package:bt_movie_app/ui/widgets/app_page_view.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_item.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopularView extends StatelessWidget {
  const MostPopularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MostPopularCubit();
      },
      child: const MostPopularChildView(),
    );
  }
}

class MostPopularChildView extends StatefulWidget {
  const MostPopularChildView({super.key});

  @override
  State<MostPopularChildView> createState() => _MostPopularChildViewState();
}

class _MostPopularChildViewState extends State<MostPopularChildView> {
  late PageController _pageController;
  late final MostPopularCubit _cubit;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostPopularCubit, MostPopularState>(
      buildWhen: (previous, current) =>
          previous.loadStatus != current.loadStatus ||
          previous.currentPage != current.currentPage,
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.loading) {
          return AppShimmer(
            height: MediaQuery.of(context).size.height * 1 / 6,
            cornerRadius: 30,
            margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
          );
        } else if (state.loadStatus == LoadStatus.failure) {
          return AppErrorView(
            height: MediaQuery.of(context).size.height * 1 / 6,
            margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
            borderRadius: 30,
            onTap: () async {
              await _cubit.loadInitialData();
            },
          );
        } else {
          return AppPageView(
            pageController: _pageController,
            onPageChange: (value) {
              _cubit.setCurrentPage(page: value);
            },
            currentPage: state.currentPage,
            itemBuilder: (BuildContext context, int index) {
              bool isCenter = state.currentPage == index;
              return MostPopularItem(
                title: state.data?.results?[index].title ?? '',
                score: state.data?.results?[index].voteAverage
                        ?.toStringAsFixed(1) ??
                    '',
                src: state.data?.results?[index].backdropPath ?? '',
                isCenter: isCenter,
                id: state.data?.results?[index].id ?? 0,
              );
            },
            length: state.listLength,
            height: 180.h,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }
}
