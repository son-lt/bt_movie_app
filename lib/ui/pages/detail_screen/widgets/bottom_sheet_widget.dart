import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/models/entities/cast_entity.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/widgets/cast_list_view.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/widgets/overview_text.dart';
import 'package:bt_movie_app/ui/widgets/imdb_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String genre;
  final bool adult;
  final String rate;
  final String overview;
  final List<CastEntity> listCast;

  const BottomSheetWidget({
    Key? key,
    required this.title,
    required this.genre,
    required this.adult,
    required this.rate,
    required this.overview,
    required this.listCast,
  }) : super(key: key);

  List<String> splitTitle(String title) {
    List<String> result = [];
    if (title.contains(': ')) {
      result = title.split(': ');
    } else {
      result.add(title);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final lisTitle = splitTitle(title);
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.05,
      snap: true,
      snapSizes: const [0.5, 0.75],
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientBackgroundColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.lineVector),
                  const SizedBox(height: 8),
                  Text(
                    lisTitle.first,
                    style: AppTextStyles.whiteS64Bold,
                    textAlign: TextAlign.center,
                  ),
                  if (lisTitle.length > 1)
                    Text(
                      lisTitle.last,
                      style: AppTextStyles.secondaryS18Bold,
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildRowBadges(),
                      buildOptions(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  OverviewText(overview: overview),
                  const SizedBox(height: 20),
                  Expanded(
                    child: CastListView(listCast: listCast),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildRowBadges() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildBadge(genre),
        if (adult) buildBadge('16+'),
        IMDBBadge(
          rate: rate,
          style: AppTextStyles.defaultS12Bold,
          width: 24,
          height: 8,
        ),
      ],
    );
  }

  Widget buildOptions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppVectors.shareVector,
          width: 24,
          height: 28,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          AppVectors.favoriteVector,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }

  Widget buildBadge(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: AppColors.gradientOptionItemBackgroundColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.whiteS12Bold,
      ),
    );
  }
}
