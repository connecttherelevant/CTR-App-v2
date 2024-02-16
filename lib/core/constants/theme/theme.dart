import 'package:flutter/material.dart';
import 'package:musicidia/core/constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
    );
  }
}
