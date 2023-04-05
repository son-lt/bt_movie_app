import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/ui/commons/inactive_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostPopularItem extends StatelessWidget {
  final String title;
  final String score;
  final bool isCenter;
  final String src;

  const MostPopularItem({
    Key? key,
    required this.title,
    required this.score,
    required this.isCenter,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: isCenter ? 16 : 28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(AppConfigs.baseImageURL + src),
          fit: BoxFit.cover,
        ),
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5 - 76,
                    child: Text(
                      title,
                      style: AppTextStyles.whiteS18Bold,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  imdbBadge(score),
                ],
              ),
            ),
          ),
          if (!isCenter) const InactiveOverlay(),
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
            style: AppTextStyles.defaultS6Bold,
          )
        ],
      ),
    );
  }
}
