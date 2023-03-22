import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/ui/commons/app_page_view.dart';
import 'package:bt_movie_app/ui/commons/inactive_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostPopularList extends StatefulWidget {
  const MostPopularList({super.key});

  @override
  State<MostPopularList> createState() => _MostPopularListState();
}

class _MostPopularListState extends State<MostPopularList> {
  int listLength = AppConfigs.listLength;
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
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
        return mostPopularItem(
          title: 'Loren Ipsum something something something',
          score: '8.5',
          isCenter: isCenter,
        );
      },
      length: listLength,
      heightScaleFactor: 1 / 6,
    );
  }

  Widget mostPopularItem({
    required String title,
    required String score,
    required bool isCenter,
  }) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: isCenter ? 16 : 36,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isCenter ? 30 : 20),
        color: Colors.deepOrange,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      child: Stack(
        children: [
          if (!isCenter) const InactiveOverlay(radius: 20),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            top: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.yellow,
                    width: MediaQuery.of(context).size.width * 0.5 - 76,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  imdbBadge(score),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imdbBadge(String rate) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.imdbBadgeBackgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.imdbBadgeVector),
          const SizedBox(width: 4),
          Text(
            rate,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 6,
            ),
          )
        ],
      ),
    );
  }
}
