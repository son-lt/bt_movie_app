import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/configs/app_configs.dart';
import 'package:bt_movie_app/models/entities/cast_entity.dart';
import 'package:flutter/material.dart';

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
          Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(AppConfigs.baseImageURL + profilePath),
                fit: BoxFit.cover,
              ),
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
