import 'package:bt_movie_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  ///default
  static final defaultS6 = TextStyle(fontSize: 6.sp);
  static final defaultS6Bold = defaultS6.copyWith(fontWeight: FontWeight.bold);

  //s12
  static final defaultS12 = TextStyle(fontSize: 12.sp);
  static final defaultS12Bold =
      defaultS12.copyWith(fontWeight: FontWeight.bold);

  ///white
  static const white = TextStyle(color: Colors.white);

  //s64
  static final whiteS64 = white.copyWith(fontSize: 64.sp);
  static final whiteS64Bold = whiteS64.copyWith(fontWeight: FontWeight.bold);

  //s18
  static final whiteS18 = white.copyWith(fontSize: 18.sp);
  static final whiteS18Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);

  //s13
  static final whiteS13 = white.copyWith(fontSize: 13.sp);
  static final whiteS13W400 = whiteS13.copyWith(fontWeight: FontWeight.w400);

  //s12
  static final whiteS12 = white.copyWith(fontSize: 12.sp);
  static final whiteS12Bold = whiteS12.copyWith(fontWeight: FontWeight.bold);
  static final whiteS12W500 = whiteS12.copyWith(fontWeight: FontWeight.w500);

  //s9
  static final whiteS9 = white.copyWith(fontSize: 9.sp);
  static final whiteS9W400 = whiteS9.copyWith(fontWeight: FontWeight.w400);

  //s8
  static final whiteS8 = white.copyWith(fontSize: 8.sp);
  static final whiteS8W500 = whiteS8.copyWith(fontWeight: FontWeight.w500);

  ///primary
  static final primary = TextStyle(color: AppColors.primaryColor);

  //s12
  static final primaryS12 = primary.copyWith(fontSize: 12.sp);
  static final primaryS12W500 =
      primaryS12.copyWith(fontWeight: FontWeight.w500);

  ///secondary
  static final secondary = TextStyle(color: AppColors.secondaryColor);

  //s18
  static final secondaryS18 = secondary.copyWith(fontSize: 18.sp);
  static final secondaryS18Bold =
      secondaryS18.copyWith(fontWeight: FontWeight.w700);

  //s8
  static final secondaryS8 = secondary.copyWith(fontSize: 8.sp);
  static final secondaryS8W500 =
      secondaryS8.copyWith(fontWeight: FontWeight.w500);
}
