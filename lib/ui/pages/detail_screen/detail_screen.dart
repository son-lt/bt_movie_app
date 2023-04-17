import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/movie_entity.dart';
import 'package:bt_movie_app/models/enums/load_status.dart';
import 'package:bt_movie_app/network/api_client.dart';
import 'package:bt_movie_app/ui/widgets/app_error_view.dart';
import 'package:bt_movie_app/ui/widgets/shimmer/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  LoadStatus loadStatus = LoadStatus.initial;
  MovieEntity? data;

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
      final result = await ApiClient.getMovieDetail(widget.id);
      if (result != null) {
        setState(() {
          loadStatus = LoadStatus.success;
          data = result;
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
      return AppShimmer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    } else if (loadStatus == LoadStatus.failure) {
      return AppErrorView(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 144),
        borderRadius: 30,
        onTap: () async {
          await loadInitialData();
        },
      );
    } else {
      return Stack(
        children: [
          Image.network(
            AppConfigs.baseImageURL + (data?.posterPath ?? ''),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
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
