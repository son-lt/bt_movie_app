import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;

  const DotsIndicator({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16).r,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildListDot(),
      ),
    );
  }

  List<Widget> buildListDot() {
    return List<Widget>.generate(
      AppConfigs.listLength,
      (index) {
        return Container(
          width: 8.h,
          height: 8.h,
          margin: const EdgeInsets.symmetric(horizontal: 4).r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: AppColors.gradientBackgroundIndicatorDot(
                opacity1: ((currentPage >= AppConfigs.listLength)
                            ? currentPage - AppConfigs.listLength
                            : currentPage) ==
                        index
                    ? 1
                    : 0.3,
              ),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}
