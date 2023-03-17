import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.linearBackgroundColor,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: buildHelloBar(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 52),
                child: buildSearchBar(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHelloBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 18),
            children: [
              TextSpan(text: 'Hello, '),
              TextSpan(
                text: 'User!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SvgPicture.asset(
          AppVectors.notiVector,
          width: 16,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }

  Widget buildSearchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.tertiaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.searchVector,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: AppColors.secondaryColor,
            thickness: 1,
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(
            AppVectors.voiceVector,
            width: 16,
            height: 22,
            colorFilter: ColorFilter.mode(
              AppColors.secondaryColor,
              BlendMode.srcIn,
            ),
          )
        ],
      ),
    );
  }
}
