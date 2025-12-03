import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._({required Color textColor}) {
    displayLarge = TextStyle(fontSize: 12, color: textColor);
    displayMedium = TextStyle(fontSize: 12, color: textColor);
    displaySmall = TextStyle(fontSize: 12, color: textColor);
    headlineLarge = TextStyle(fontSize: 12, color: textColor);
    headlineMedium = TextStyle(fontSize: 12, color: textColor);
    headlineSmall = TextStyle(fontSize: 12, color: textColor);
    titleLarge = TextStyle(fontSize: 12, color: textColor);
    titleMedium = TextStyle(fontSize: 12, color: textColor);
    titleSmall = TextStyle(fontSize: 12, color: textColor);
    bodyLarge = TextStyle(fontSize: 12, color: textColor);
    bodyMedium = TextStyle(fontSize: 12, color: textColor);
    bodySmall = TextStyle(fontSize: 12, color: textColor);
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
}
