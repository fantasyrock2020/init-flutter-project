import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class AppLocalizationConfig {
  const AppLocalizationConfig._();

  static List<LocalizationsDelegate<dynamic>> get delegates =>
      AppLocalizations.localizationsDelegates;
}
