import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.tertiaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.searchVector,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: AppColors.secondaryColor,
            thickness: 1,
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(
            AppVectors.voiceVector,
            width: 16,
            height: 22,
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
