import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorView extends StatelessWidget {
  final double height;
  final EdgeInsets margin;
  final double borderRadius;
  final Function() onTap;

  const AppErrorView({
    Key? key,
    this.height = double.infinity,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: AppColors.gradientSearchBarBackgroundColor,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Error!',
              style: AppTextStyles.whiteS18Bold,
            ),
             SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                onTap;
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  gradient: LinearGradient(
                    colors: AppColors.gradientSearchBarBackgroundColor,
                  ),
                ),
                child: Text(
                  'Reload?',
                  style: AppTextStyles.whiteS13W400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
