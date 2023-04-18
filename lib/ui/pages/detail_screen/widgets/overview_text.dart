import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:flutter/material.dart';

class OverviewText extends StatefulWidget {
  final String overview;

  const OverviewText({
    Key? key,
    required this.overview,
  }) : super(key: key);

  @override
  State<OverviewText> createState() => _OverviewTextState();
}

class _OverviewTextState extends State<OverviewText> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Text(
              widget.overview,
              style: AppTextStyles.primaryS12W500.copyWith(
                overflow: isShow ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
              maxLines: isShow ? null : 3,
            ),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () {
                setState(() {
                  isShow = !isShow;
                });
              },
              child: Text(
                isShow ? 'Less' : 'More',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: AppColors.gradientTextButtonColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(Rect.largest),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
