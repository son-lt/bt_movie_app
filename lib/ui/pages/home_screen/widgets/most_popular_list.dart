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
  int listLength = AppConfigs.listLength;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: MediaQuery.of(context).size.height * 1 / 6,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return mostPopularItem(index);
        },
        itemCount: listLength,
      ),
    );
  }

  Widget mostPopularItem(int index) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 20,
              right: index == listLength ? 0 : 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 20,
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
                      style: TextStyle(
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
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 6,
            ),
          )
        ],
      ),
    );
  }
}
