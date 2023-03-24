import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.tertiaryColor,
          width: 1,
        ),
        gradient: LinearGradient(
          colors: AppColors.gradientSearchBarBackgroundColor,
        ),
        color: AppColors.tertiaryColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buildIcon(currentIndex),
      ),
    );
  }

  List<Widget> buildIcon(int currentIndex) {
    return List<Widget>.generate(
      AppConfigs.bottomNavigationBarVectorList.length,
      (index) {
        bool isChoose = currentIndex == index;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppConfigs.bottomNavigationBarVectorList[index],
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            if (isChoose)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              )
          ],
        );
      },
    );
  }
}
