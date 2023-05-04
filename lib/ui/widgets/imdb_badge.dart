import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IMDBBadge extends StatelessWidget {
  final String rate;
  final TextStyle style;
  final double width;
  final double height;

  const IMDBBadge({
    Key? key,
    required this.rate,
    required this.style,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15).r,
        color: AppColors.imdbBadgeBackgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.imdbBadgeVector,
            width: width,
            height: height,
          ),
           SizedBox(width: 4.w),
          Text(
            rate,
            style: style,
          )
        ],
      ),
    );
  }
}
