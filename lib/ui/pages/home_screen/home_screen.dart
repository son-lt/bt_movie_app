import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
        // bottomNavigationBar: buildBottomNavigationBar(),
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
        children: const [
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 64),
            child: HelloBar(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: SearchBar(),
          ),
          SizedBox(height: 28),
          Padding(
            padding: EdgeInsets.only(left: 52),
            child: Text(
              'Most Popular',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          MostPopularList(),
          SizedBox(height: 4),
          ListOptions(),
          SizedBox(height: 36),
          Padding(
            padding: EdgeInsets.only(left: 52, bottom: 16),
            child: Text(
              'Upcoming releases',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          UpcomingReleasesList(),
        ],
      ),
    );
  }
}
