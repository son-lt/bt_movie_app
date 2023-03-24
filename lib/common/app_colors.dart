import 'package:flutter/material.dart';

class AppColors {
  static const List<Color> gradientBackgroundColor = [
    Color(0xFF2B5876),
    Color(0xFF4E4376),
  ];

  static List<Color> gradientSearchBarBackgroundColor = [
    const Color(0xFF6B66A6).withOpacity(0.3),
    const Color(0xFF75D1DD).withOpacity(0.3),
  ];

  static List<Color> gradientOptionItemBackgroundColor = [
    const Color(0xFFA6A1E0).withOpacity(0.3),
    const Color(0xFFA1F3FE).withOpacity(0.3),
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

  static Color primaryColor = Colors.white.withOpacity(0.75);

  static Color secondaryColor = Colors.white.withOpacity(0.5);

  static Color tertiaryColor = Colors.white.withOpacity(0.2);

  static const Color imdbBadgeBackgroundColor = Color(0xFFF5C518);
}
