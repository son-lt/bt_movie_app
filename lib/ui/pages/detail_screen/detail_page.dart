import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/detail_view_model.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/widgets/bottom_sheet_widget.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
  late final DetailViewModel provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<DetailViewModel>();
    provider.loadInitialData(widget.args.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<DetailViewModel>(
          builder: (context, value, child) {
            return _buildBody(value);
          },
        ),
      ),
    );
  }

  Widget _buildBody(DetailViewModel state) {
    if (state.loadStatus == LoadStatus.loading) {
      return AppShimmer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    } else if (state.loadStatus == LoadStatus.failure) {
      return AppErrorView(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 144),
        borderRadius: 30,
        onTap: () async {
          await provider.loadInitialData(widget.args.id);
        },
      );
    } else {
      return Stack(
        children: [
          Image.network(
            AppConfigs.baseImageURL + (state.movieData?.posterPath ?? ''),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
            title: state.movieData?.title ?? '',
            genre: state.movieData?.genres?.first.name ?? '',
            adult: state.movieData?.adult ?? false,
            rate: state.movieData?.voteAverage?.toStringAsFixed(1) ?? '',
            overview: state.movieData?.overview ?? '',
            listCast: state.castListData?.cast ?? [],
          ),
          Positioned(
            left: 52,
            top: 54,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                AppVectors.backVector,
                width: 24,
                height: 24,
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
