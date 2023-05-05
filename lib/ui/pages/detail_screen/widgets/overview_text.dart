import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewText extends StatelessWidget {
  final String overview;
  final bool isShow;
  final Function() showMoreText;

  const OverviewText({
    Key? key,
    required this.overview,
    required this.isShow,
    required this.showMoreText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Text(
              overview,
              style: AppTextStyles.primaryS12W500,
              overflow: isShow ? TextOverflow.visible : TextOverflow.ellipsis,
              maxLines: isShow ? null : 3,
            ),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: showMoreText,
              child: Text(
                isShow ? 'Less' : 'More',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: AppColors.gradientTextButtonColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(Rect.largest),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
