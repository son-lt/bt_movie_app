import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_logic.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_state.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/widgets/bottom_sheet_widget.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailPageArgs {
  final int id;

  DetailPageArgs({required this.id});
}

class DetailPage extends StatefulWidget {
  final DetailPageArgs args;

  const DetailPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailLogic logic = Get.put(DetailLogic());
  final DetailState state = Get.find<DetailLogic>().state;

  @override
  void initState() {
    super.initState();
    logic.loadInitialData(widget.args.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            return _buildBody();
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (state.loadStatus.value == LoadStatus.loading) {
      return const AppShimmer(
        width: double.infinity,
        height: double.infinity,
      );
    } else if (state.loadStatus.value == LoadStatus.failure) {
      return AppErrorView(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 144).r,
        borderRadius: 30.r,
        onTap: () async {
          await logic.loadInitialData(widget.args.id);
        },
      );
    } else {
      return Stack(
        children: [
          Image.network(
            AppConfigs.baseImageURL + (state.movieData.value.posterPath ?? ''),
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
            title: state.movieData.value.title ?? '',
            genre: state.movieData.value.genres?.first.name ?? '',
            adult: state.movieData.value.adult ?? false,
            rate: state.movieData.value.voteAverage?.toStringAsFixed(1) ?? '',
            overview: state.movieData.value.overview ?? '',
            listCast: state.castListData.value.cast ?? [],
            listLength: state.listLength.value,
            showMoreCast: () {
              logic.showMoreCast();
            },
            isShow: state.isShow.value,
            showMoreText: () {
              logic.setIsShow();
            },
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
