import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onPageChange;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onPageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 12,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.tertiaryColor,
          width: 1,
        ),
        gradient: const LinearGradient(
          colors: AppColors.gradientBackgroundColor,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientSearchBarBackgroundColor,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: buildIcon(currentIndex),
        ),
      ),
    );
  }

  List<Widget> buildIcon(int currentIndex) {
    return List<Widget>.generate(
      AppConfigs.bottomNavigationBarVectorList.length,
      (index) {
        bool isChoose = currentIndex == index;
        return InkWell(
          onTap: () {
            onPageChange(index);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppConfigs.bottomNavigationBarVectorList[index],
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isChoose ? Colors.white : AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 8),
              Visibility(
                visible: isChoose,
                replacement: const SizedBox(height: 4),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
