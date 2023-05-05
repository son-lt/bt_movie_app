import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/widgets/app_page_view.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_page.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/inactive_overlay.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'upcoming_releases_cubit.dart';

class UpcomingReleasesView extends StatelessWidget {
  const UpcomingReleasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UpcomingReleasesCubit();
      },
      child: const UpcomingReleasesChildView(),
    );
  }
}

class UpcomingReleasesChildView extends StatefulWidget {
  const UpcomingReleasesChildView({super.key});

  @override
  State<UpcomingReleasesChildView> createState() =>
      _UpcomingReleasesChildViewState();
}

class _UpcomingReleasesChildViewState extends State<UpcomingReleasesChildView> {
  late PageController _pageController;
  late final UpcomingReleasesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.4);
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingReleasesCubit, UpcomingReleasesState>(
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.loading) {
          return AppShimmer(
            height: 216.h,
            margin: const EdgeInsets.symmetric(horizontal: 144).r,
            cornerRadius: 30,
          );
        } else if (state.loadStatus == LoadStatus.failure) {
          return AppErrorView(
            height: 216.h,
            margin: const EdgeInsets.symmetric(horizontal: 144).r,
            borderRadius: 30.r,
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
              return upcomingReleaseItem(
                src: state.data?.results?[index].posterPath ?? '',
                isCenter: isCenter,
                id: state.data?.results?[index].id ?? 0,
              );
            },
            height: 256.h,
            length: state.listLength,
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

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }
}
