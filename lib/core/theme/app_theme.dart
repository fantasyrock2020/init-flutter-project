import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const AppColors.light().primary,
      error: const AppColors.light().error,
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppTypography.textThemeExtension.copyWith(
        textColor: const AppColors.light().primary,
      ),
    ],
  );

  static ThemeData darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: const AppColors.dark().primary,
      error: const AppColors.dark().error,
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppTypography.textThemeExtension.copyWith(
        textColor: const AppColors.dark().primary,
      ),
    ],
  );
}
