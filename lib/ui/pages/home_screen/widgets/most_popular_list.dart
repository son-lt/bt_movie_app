import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostPopularList extends StatefulWidget {
  const MostPopularList({super.key});

  @override
  State<MostPopularList> createState() => _MostPopularListState();
}

class _MostPopularListState extends State<MostPopularList> {
  int listLength = AppConfigs.listLength * 2;
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 1 / 6,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: _pageController,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              bool isCenter = currentPage == index;
              return mostPopularItem(isCenter);
            },
            itemCount: listLength,
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Widget mostPopularItem(bool isCenter) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isCenter ? 16 : 36,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isCenter ? 30 : 20),
        color: Colors.red,
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      child: Stack(
        children: [
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
                      'Loren ipsum something something something',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  imdbBadge('8.5'),
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

  Widget buildIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildListDot(),
      ),
    );
  }

  List<Widget> buildListDot() {
    return List<Widget>.generate(
      AppConfigs.listLength,
      (index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: AppColors.linearBackgroundIndicatorDot(
                ((currentPage >= AppConfigs.listLength)
                            ? currentPage - AppConfigs.listLength
                            : currentPage) ==
                        index
                    ? 1
                    : 0.3,
              ),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}
