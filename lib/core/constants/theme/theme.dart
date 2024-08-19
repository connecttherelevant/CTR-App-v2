import 'package:flutter/material.dart';
import 'package:musicidia/core/constants/colors.dart';
import 'package:musicidia/core/constants/font_size.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: TextTheme(
        labelLarge: TextStyle(
          color: AppColors.labelColor,
          fontSize: k16FontSize,
          letterSpacing: k41Letterspacing,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: AppColors.labelColor,
          fontSize: k13FontSize,
          letterSpacing: k27Letterspacing,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: AppColors.labelColor,
          fontSize: k11FontSize,
          letterSpacing: k27Letterspacing,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontSize: k34FontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
