import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../constants/typography.dart';
import '../../theme/app_theme.dart';
import '../../constants/colors.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        ThemeState(
          themeMode: ThemeMode.light,
          themeData: AppTheme.lightTheme,
          colors: const AppColors.light(),
          textStyles: AppTextStyles.light(),
        ),
      );

  void getSystemThemeAndSync() {
    final Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    if (brightness == Brightness.dark) {
      changTheme(ThemeMode.dark);
    } else {
      changTheme(ThemeMode.light);
    }
  }

  void changTheme(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        emit(
          state.copyWith(
            themeMode: ThemeMode.dark,
            themeData: AppTheme.darkTheme,
            colors: const AppColors.dark(),
            textStyles: AppTextStyles.dark(),
          ),
        );
        break;
      default:
        emit(
          state.copyWith(
            themeMode: ThemeMode.light,
            themeData: AppTheme.lightTheme,
            colors: const AppColors.light(),
            textStyles: AppTextStyles.light(),
          ),
        );
    }
  }
}
