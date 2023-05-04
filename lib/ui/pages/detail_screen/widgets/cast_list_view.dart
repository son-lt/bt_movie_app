import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/common/app_vectors.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/cast_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CastListView extends StatefulWidget {
  final List<CastEntity> listCast;

  const CastListView({
    Key? key,
    required this.listCast,
  }) : super(key: key);

  @override
  State<CastListView> createState() => _CastListViewState();
}

class _CastListViewState extends State<CastListView> {
  int listLength = 5;

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
            if (listLength != widget.listCast.length)
              InkWell(
                onTap: () {
                  setState(() {
                    listLength = widget.listCast.length;
                  });
                },
                child: Text(
                  'See All',
                  style: AppTextStyles.whiteS12W500,
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listLength,
            itemBuilder: (BuildContext context, int index) {
              return buildCastItem(
                profilePath: widget.listCast[index].profilePath ?? '',
                name: widget.listCast[index].name ?? '',
                character: widget.listCast[index].character ?? '',
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
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
      width: 52,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              AppConfigs.baseImageURL + profilePath,
              height: 52,
              width: 52,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                  AppVectors.accountVector,
                  height: 52,
                  width: 52,
                  fit: BoxFit.cover,
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SizedBox(
                  height: 52,
                  width: 52,
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
          const SizedBox(height: 8),
          Text(
            name,
            style: AppTextStyles.whiteS8W500,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
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
