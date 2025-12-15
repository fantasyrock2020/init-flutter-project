import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/theme/theme.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeMode themeMode,
    required ThemeData themeData,
    required AppColors colors,
    required AppTextStyles textStyles,
  }) = _ThemeState;
}
