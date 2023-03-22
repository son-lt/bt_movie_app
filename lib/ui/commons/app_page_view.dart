import 'package:bt_movie_app/ui/commons/dots_indicator.dart';
import 'package:flutter/material.dart';

class AppPageView extends StatelessWidget {
  final double heightScaleFactor;
  final PageController pageController;
  final void Function(int) onPageChange;
  final int currentPage;
  final Widget Function(BuildContext, int) itemBuilder;
  final int length;

  const AppPageView({
    Key? key,
    required this.pageController,
    required this.onPageChange,
    required this.currentPage,
    required this.itemBuilder,
    required this.length,
    required this.heightScaleFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * heightScaleFactor,
          width: MediaQuery.of(context).size.width,
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
