import 'package:flutter/material.dart';

@immutable
class AppColors {
  static const Color error = Color(0xFFF44336);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF757575);
  static const Color darkGrey = Color(0xFF222222);
  static const Color black = Color(0xFF000000);
  static const Color secondaryBlack = Color(0xFF111111);
}

class GradientBackGround {
  static BoxDecoration get gradientDecoration {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.black,
          AppColors.secondaryBlack,
          AppColors.secondaryBlack,
          AppColors.black,
        ],
        stops: [
          0.0,
          0.5,
          0.6,
          1.0,
        ],
      ),
    );
  }
}
