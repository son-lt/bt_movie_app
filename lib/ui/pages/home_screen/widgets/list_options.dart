import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListOptions extends StatelessWidget {
  const ListOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(
          AppConfigs.listOptions.length,
          (index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              height: MediaQuery.of(context).size.height * 1 / 9,
              width: MediaQuery.of(context).size.width * 1 / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.tertiaryColor,
                  width: 1,
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
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppConfigs.listOptions.keys.elementAt(index),
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
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
