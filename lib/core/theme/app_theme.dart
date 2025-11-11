import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: const AppColors.light().primary,
      error: const AppColors.light().error,
    ),
  );

  static ThemeData darkTheme = lightTheme.copyWith(
    colorScheme: ColorScheme.dark(
      primary: const AppColors.dark().primary,
      error: const AppColors.dark().error,
    ),
  );
}
