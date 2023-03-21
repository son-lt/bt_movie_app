import 'package:flutter/material.dart';

class AppColors {
  static const List<Color> linearBackgroundColor = [
    Color(0xFF2B5876),
    Color(0xFF4E4376),
  ];

  static List<Color> linearBackgroundIndicatorDot(double opacity) {
    return [
      const Color(0xFF64ABDB).withOpacity(opacity),
      const Color(0xFF826EC8).withOpacity(opacity),
    ];
  }

  static Color primaryColor = Colors.white.withOpacity(0.75);

  static Color secondaryColor = Colors.white.withOpacity(0.5);

  static Color tertiaryColor = Colors.white.withOpacity(0.2);

  static const Color imdbBadgeBackgroundColor = Color(0xFFF5C518);
}
