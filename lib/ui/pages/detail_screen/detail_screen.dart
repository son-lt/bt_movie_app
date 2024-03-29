import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/cast_list_entity.dart';
import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/widgets/bottom_sheet_widget.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  LoadStatus loadStatus = LoadStatus.initial;
  MovieEntity? movieData;
  CastListEntity? castListData;

  @override
  void initState() {
    super.initState();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    setState(() {
      loadStatus = LoadStatus.loading;
    });
    try {
      final movieResult = await ApiClient.getMovieDetail(widget.id);
      final castListResult = await ApiClient.getCastList(widget.id);
      if (movieResult != null && castListResult != null) {
        setState(() {
          loadStatus = LoadStatus.success;
          movieData = movieResult;
          castListData = castListResult;
        });
      }
    } catch (e) {
      setState(() {
        loadStatus = LoadStatus.failure;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (loadStatus == LoadStatus.loading) {
      return const AppShimmer(
        width: double.infinity,
        height:  double.infinity,
      );
    } else if (loadStatus == LoadStatus.failure) {
      return AppErrorView(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 144).r,
        borderRadius: 30.r,
        onTap: () async {
          await loadInitialData();
        },
      );
    } else {
      return Stack(
        children: [
          Image.network(
            AppConfigs.baseImageURL + (movieData?.posterPath ?? ''),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const AppShimmer();
              }
            },
          ),
          BottomSheetWidget(
            title: movieData?.title ?? '',
            genre: movieData?.genres?.first.name ?? '',
            adult: movieData?.adult ?? false,
            rate: movieData?.voteAverage?.toStringAsFixed(1) ?? '',
            overview: movieData?.overview ?? '',
            listCast: castListData?.cast ?? [],
          ),
          Positioned(
            left: 52.w,
            top: 54.h,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                AppVectors.backVector,
                width: 24.h,
                height: 24.h,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
