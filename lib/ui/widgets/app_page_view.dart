import 'package:bt_movie_app/ui/widgets/dots_indicator.dart';
import 'package:flutter/material.dart';

class AppPageView extends StatelessWidget {
  final PageController pageController;
  final void Function(int) onPageChange;
  final int currentPage;
  final Widget Function(BuildContext, int) itemBuilder;
  final int length;
  final double height;

  const AppPageView({
    Key? key,
    required this.pageController,
    required this.onPageChange,
    required this.currentPage,
    required this.itemBuilder,
    required this.length,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: pageController,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            onPageChanged: onPageChange,
            itemBuilder: itemBuilder,
            itemCount: length,
          ),
        ),
        DotsIndicator(currentPage: currentPage),
      ],
    );
  }
}
