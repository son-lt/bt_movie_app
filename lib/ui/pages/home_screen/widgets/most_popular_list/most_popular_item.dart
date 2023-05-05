import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_page.dart';
import 'package:bt_movie_app/ui/widgets/imdb_badge.dart';
import 'package:bt_movie_app/ui/widgets/inactive_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopularItem extends StatelessWidget {
  final String title;
  final String score;
  final bool isCenter;
  final String src;
  final int id;

  const MostPopularItem({
    Key? key,
    required this.title,
    required this.score,
    required this.isCenter,
    required this.src,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: isCenter ? 16 : 28,
        ).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30).r,
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
              bottom: 20.h,
              left: 0,
              right: 0,
              top: 20.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 20).r,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140.w,
                      child: Text(
                        title,
                        style: AppTextStyles.whiteS18Bold,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IMDBBadge(
                      rate: score,
                      style: AppTextStyles.defaultS6Bold,
                      width: 12.w,
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ),
            if (!isCenter) const InactiveOverlay(),
          ],
        ),
      ),
    );
  }
}
