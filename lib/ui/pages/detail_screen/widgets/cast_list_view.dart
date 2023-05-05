import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/cast_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CastListView extends StatelessWidget {
  final List<CastEntity> listCast;
  final int listLength;
  final Function() showMoreCast;

  const CastListView({
    Key? key,
    required this.listCast,
    required this.listLength,
    required this.showMoreCast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cast',
              style: AppTextStyles.whiteS18Bold,
            ),
            if (listLength != listCast.length)
              InkWell(
                onTap: showMoreCast,
                child: Text(
                  'See All',
                  style: AppTextStyles.whiteS12W500,
                ),
              ),
          ],
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listLength,
            itemBuilder: (BuildContext context, int index) {
              return buildCastItem(
                profilePath: listCast[index].profilePath ?? '',
                name: listCast[index].name ?? '',
                character: listCast[index].character ?? '',
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 20.w);
            },
          ),
        ),
      ],
    );
  }

  Widget buildCastItem({
    required String profilePath,
    required String name,
    required String character,
  }) {
    return SizedBox(
      width: 52.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              AppConfigs.baseImageURL + profilePath,
              height: 52.h,
              width: 52.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                  AppVectors.accountVector,
                  height: 52.h,
                  width: 52.h,
                  fit: BoxFit.cover,
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SizedBox(
                  height: 52.h,
                  width: 52.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: AppTextStyles.whiteS8W500,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            character,
            style: AppTextStyles.secondaryS8W500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
