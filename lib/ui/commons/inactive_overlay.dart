import 'package:bt_movie_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class InactiveOverlay extends StatelessWidget {
  final double radius;

  const InactiveOverlay({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          colors: AppColors.linearBackgroundIndicatorDot(
            opacity1: 0.5,
            opacity2: 0.1,
          ),
        ),
      ),
    );
  }
}
