import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 84.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.tertiaryColor,
          width: 1.w,
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60).r,
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
                width: 24.h,
                height: 24.h,
                colorFilter: ColorFilter.mode(
                  isChoose ? Colors.white : AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 8.h),
              Visibility(
                visible: isChoose,
                replacement: SizedBox(height: 4.h),
                child: Container(
                  width: 4.h,
                  height: 4.h,
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
