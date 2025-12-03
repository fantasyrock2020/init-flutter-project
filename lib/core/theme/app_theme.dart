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
    ),
  );
}
