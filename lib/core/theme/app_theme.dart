import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const AppColors.light().primary,
      error: const AppColors.light().error,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.light().bodyLarge,
      bodyMedium: AppTextStyles.light().bodyMedium,
      bodySmall: AppTextStyles.light().bodySmall,
      headlineLarge: AppTextStyles.light().headlineLarge,
      headlineMedium: AppTextStyles.light().headlineMedium,
      headlineSmall: AppTextStyles.light().headlineSmall,
      titleLarge: AppTextStyles.light().titleLarge,
      titleMedium: AppTextStyles.light().titleMedium,
      titleSmall: AppTextStyles.light().titleSmall,
      labelLarge: AppTextStyles.light().labelLarge,
      labelSmall: AppTextStyles.light().labelSmall,
      labelMedium: AppTextStyles.light().labelMedium,
    ),
  );

  static ThemeData darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: const AppColors.dark().primary,
      error: const AppColors.dark().error,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.dark().bodyLarge,
      bodyMedium: AppTextStyles.dark().bodyMedium,
      bodySmall: AppTextStyles.dark().bodySmall,
      headlineLarge: AppTextStyles.dark().headlineLarge,
      headlineMedium: AppTextStyles.dark().headlineMedium,
      headlineSmall: AppTextStyles.dark().headlineSmall,
      titleLarge: AppTextStyles.dark().titleLarge,
      titleMedium: AppTextStyles.dark().titleMedium,
      titleSmall: AppTextStyles.dark().titleSmall,
      labelLarge: AppTextStyles.dark().labelLarge,
      labelSmall: AppTextStyles.dark().labelSmall,
      labelMedium: AppTextStyles.dark().labelMedium,
    ),
  );
}
