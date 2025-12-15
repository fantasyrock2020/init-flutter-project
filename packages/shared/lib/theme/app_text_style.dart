import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._({required Color textColor}) {
    displayLarge = TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      color: textColor,
      letterSpacing: -0.25,
      height: 1.12,
    );

    displayMedium = TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: textColor,
      height: 1.16,
    );

    displaySmall = TextStyle(
      color: textColor,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.22,
    );

    headlineLarge = TextStyle(
      color: textColor,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.25,
    );

    headlineMedium = TextStyle(
      color: textColor,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.29,
    );

    headlineSmall = TextStyle(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.33,
    );

    titleLarge = TextStyle(
      color: textColor,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.27,
    );

    titleMedium = TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.50,
    );

    titleSmall = TextStyle(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    );

    bodyLarge = TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.50,
    );

    bodyMedium = TextStyle(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    );

    bodySmall = TextStyle(
      color: textColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
    );

    labelLarge = TextStyle(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    );

    labelMedium = TextStyle(
      color: textColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    );

    labelSmall = TextStyle(
      color: textColor,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
    );
  }

  factory AppTextStyles.light() =>
      AppTextStyles._(textColor: const AppColors.light().primary);

  factory AppTextStyles.dark() =>
      AppTextStyles._(textColor: const AppColors.dark().primary);

  late final TextStyle displayLarge;
  late final TextStyle displayMedium;
  late final TextStyle displaySmall;
  late final TextStyle headlineLarge;
  late final TextStyle headlineMedium;
  late final TextStyle headlineSmall;
  late final TextStyle titleLarge;
  late final TextStyle titleMedium;
  late final TextStyle titleSmall;
  late final TextStyle bodyLarge;
  late final TextStyle bodyMedium;
  late final TextStyle bodySmall;
  late final TextStyle labelLarge;
  late final TextStyle labelMedium;
  late final TextStyle labelSmall;
}
