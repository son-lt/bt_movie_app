import 'package:bt_movie_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  ///default
  static const defaultS6 = TextStyle(fontSize: 6);
  static final defaultS6Bold = defaultS6.copyWith(fontWeight: FontWeight.bold);

  ///white
  static const white = TextStyle(color: Colors.white);

  //s18
  static final whiteS18 = white.copyWith(fontSize: 18);
  static final whiteS18Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);

  static final whiteS9 = white.copyWith(fontSize: 9);
  static final whiteS9W400 = whiteS9.copyWith(fontWeight: FontWeight.w400);

  static final whiteS13 = white.copyWith(fontSize: 13);
  static final whiteS13W400 = whiteS13.copyWith(fontWeight: FontWeight.w400);

  ///secondary
  static final secondary = TextStyle(color: AppColors.secondaryColor);

  //s18
  static final secondaryS18 = secondary.copyWith(fontSize: 18);

  ///
}
