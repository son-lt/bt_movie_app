import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppConfigs {
  static const int listLength = 20;

  static const Map<String, String> listOptions = {
    'Genres': AppVectors.genresVector,
    'TV series': AppVectors.tvSeriesVector,
    'Movies': AppVectors.moviesVector,
    'In theatre': AppVectors.inTheatreVector,
  };

  static List<BottomNavigationBarItem> bottomNavigationBarItemList = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppVectors.homeVector,
        colorFilter: ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppVectors.favoriteVector,
        colorFilter: ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppVectors.ticketVector,
        colorFilter: ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppVectors.accountVector,
        colorFilter: ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppVectors.shuffleVector,
        colorFilter: ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    ),
  ];
}
