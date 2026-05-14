import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_state.dart';
part 'language_cubit.freezed.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
    : super(
        const LanguageState(
          locale: Locale('en'),
          supportedLocales: <Locale>[Locale('vi'), Locale('en')],
        ),
      );

  void changeLanguage(Locale locale) {
    emit(state.copyWith(locale: locale));
  }
}
