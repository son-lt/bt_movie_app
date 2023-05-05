import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListOptions extends StatelessWidget {
  const ListOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52).r,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(
          AppConfigs.listOptions.length,
          (index) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16).r,
              height: 96.h,
              width: 68.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15).r,
                border: Border.all(
                  color: AppColors.tertiaryColor,
                  width: 1.w,
                ),
                gradient: LinearGradient(
                  colors: AppColors.gradientOptionItemBackgroundColor,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppConfigs.listOptions.values.elementAt(index),
                    width: 32.h,
                    height: 32.h,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    AppConfigs.listOptions.keys.elementAt(index),
                    style: AppTextStyles.whiteS9W400,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
