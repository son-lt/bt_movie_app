import 'package:bt_movie_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class InactiveOverlay extends StatelessWidget {
  const InactiveOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: AppColors.gradientBackgroundIndicatorDot(
            opacity1: 0.5,
            opacity2: 0.1,
          ),
        ),
      ),
    );
  }
}
