part of 'language_cubit.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  const factory LanguageState({
    required Locale locale,
    required Iterable<Locale> supportedLocales,
  }) = _LanguageState;
}
