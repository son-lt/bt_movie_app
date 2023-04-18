import 'package:flutter/material.dart';

class AppColors {
  static const List<Color> gradientBackgroundColor = [
    Color(0xFF2B5876),
    Color(0xFF4E4376),
  ];

  static final List<Color> gradientSearchBarBackgroundColor = [
    const Color(0xFF6B66A6).withOpacity(0.3),
    const Color(0xFF75D1DD).withOpacity(0.3),
  ];

  static final List<Color> gradientOptionItemBackgroundColor = [
    const Color(0xFFA6A1E0).withOpacity(0.3),
    const Color(0xFFA1F3FE).withOpacity(0.3),
  ];

  static final List<Color> gradientTextButtonColor = [
    const Color(0xFFA6A1E0),
    const Color(0xFFA1F3FE),
  ];

  static List<Color> gradientBackgroundIndicatorDot({
    required double opacity1,
    double? opacity2,
  }) {
    return [
      const Color(0xFF64ABDB).withOpacity(opacity1),
      const Color(0xFF826EC8).withOpacity(opacity2 ?? opacity1),
    ];
  }

  static final Color baseShimmerColor =
      const Color(0xFF64ABDB).withOpacity(0.5);

  static final Color highlightShimmerColor =
      const Color(0xFF826EC8).withOpacity(0.1);

  static final Color primaryColor = Colors.white.withOpacity(0.75);

  static final Color secondaryColor = Colors.white.withOpacity(0.5);

  static final Color tertiaryColor = Colors.white.withOpacity(0.2);

  static const Color imdbBadgeBackgroundColor = Color(0xFFF5C518);
}
