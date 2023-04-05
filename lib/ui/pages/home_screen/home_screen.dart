import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/ui/commons/custom_bottom_navigation_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/hello_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/list_options.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/search_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/upcoming_releases_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentPage,
          onPageChange: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientBackgroundColor,
        ),
      ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 64),
            child: HelloBar(),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: SearchBar(),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Text(
              'Most Popular',
              style: AppTextStyles.whiteS18Bold
            ),
          ),
          const MostPopularList(),
          const SizedBox(height: 4),
          const ListOptions(),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.only(left: 52, bottom: 16),
            child: Text(
              'Upcoming releases',
              style: AppTextStyles.whiteS18Bold
            ),
          ),
          const UpcomingReleasesList(),
        ],
      ),
    );
  }
}
