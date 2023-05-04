import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/hello_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/list_options.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_view.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/search_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/upcoming_releases_list/upcoming_releases_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeCubit();
      },
      child: const HomeChildPage(),
    );
  }
}

class HomeChildPage extends StatefulWidget {
  const HomeChildPage({super.key});

  @override
  State<HomeChildPage> createState() => _HomeChildPageState();
}

class _HomeChildPageState extends State<HomeChildPage> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.currentPage != current.currentPage,
            builder: (context, state) {
              return CustomBottomNavigationBar(
                currentIndex: state.currentPage,
                onPageChange: (value) {
                  _cubit.setCurrentPage(page: value);
                },
              );
            }),
      ),
    );
  }

  Widget _buildBody() {
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
              style: AppTextStyles.whiteS18Bold,
            ),
          ),
          const MostPopularView(),
          const SizedBox(height: 4),
          const ListOptions(),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.only(left: 52, bottom: 16),
            child: Text(
              'Upcoming releases',
              style: AppTextStyles.whiteS18Bold,
            ),
          ),
          const UpcomingReleasesView(),
        ],
      ),
    );
  }
}
