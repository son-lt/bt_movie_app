import 'package:bt_movie_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color? baseColor;
  final Color? highlightColor;

  const AppShimmer({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.cornerRadius = 0,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.baseShimmerColor,
      highlightColor: highlightColor ?? AppColors.highlightShimmerColor,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(cornerRadius),
            ),
          ),
        ),
      ),
    );
  }
}
