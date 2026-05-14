part of 'theme_cubit.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeMode themeMode,
    required ThemeData themeData,
    required AppColors colors,
    required AppTextStyles textStyles,
  }) = _ThemeState;
}
