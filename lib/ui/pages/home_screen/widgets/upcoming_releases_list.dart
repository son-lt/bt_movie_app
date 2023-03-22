import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/ui/commons/app_page_view.dart';
import 'package:bt_movie_app/ui/commons/inactive_overlay.dart';
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

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.4);
  }

  @override
  Widget build(BuildContext context) {
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
        return upcomingReleaseItem(isCenter);
      },
      length: listLength,
      heightScaleFactor: 1 / 4,
    );
  }

  Widget upcomingReleaseItem(bool isCenter) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.yellow,
      ),
      child: Stack(
        children: [
          if (!isCenter) const InactiveOverlay(),
        ],
      ),
    );
  }
}
