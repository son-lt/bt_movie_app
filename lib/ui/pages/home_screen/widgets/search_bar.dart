import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15).r,
        gradient: LinearGradient(
          colors: AppColors.gradientSearchBarBackgroundColor,
        ),
        border: Border.all(
          color: AppColors.tertiaryColor,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.searchVector,
            width: 24.h,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: AppTextStyles.secondaryS18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0).r,
            child: VerticalDivider(
              color: AppColors.secondaryColor,
              thickness: 1,
            ),
          ),
          SizedBox(width: 16.w),
          SvgPicture.asset(
            AppVectors.voiceVector,
            width: 16.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.secondaryColor,
              BlendMode.srcIn,
            ),
          )
        ],
      ),
    );
  }
}
