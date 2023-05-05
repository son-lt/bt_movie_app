import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/models/entities/cast_entity.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/widgets/cast_list_view.dart';
import 'package:bt_movie_app/ui/pages/detail_screen/widgets/overview_text.dart';
import 'package:bt_movie_app/ui/widgets/imdb_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String genre;
  final bool adult;
  final String rate;
  final String overview;
  final List<CastEntity> listCast;
  final int listLength;
  final Function() showMoreCast;
  final bool isShow;
  final Function() showMoreText;

  const BottomSheetWidget({
    Key? key,
    required this.title,
    required this.genre,
    required this.adult,
    required this.rate,
    required this.overview,
    required this.listCast,
    required this.listLength,
    required this.showMoreCast,
    required this.isShow,
    required this.showMoreText,
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
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.gradientBackgroundColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.vertical(
              top: const Radius.circular(50).r,
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12).r,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.lineVector),
                  SizedBox(height: 8.h),
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
                  SizedBox(height: 28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildRowBadges(),
                      buildOptions(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  OverviewText(
                    overview: overview,
                    isShow: isShow,
                    showMoreText: showMoreText,
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: CastListView(
                      listCast: listCast,
                      listLength: listLength,
                      showMoreCast: showMoreCast,
                    ),
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
          width: 24.w,
          height: 8.h,
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
          width: 24.w,
          height: 28.h,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 12.w),
        SvgPicture.asset(
          AppVectors.favoriteVector,
          width: 24.h,
          height: 24.h,
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
      margin: const EdgeInsets.only(right: 12).r,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15).r,
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
