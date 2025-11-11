import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/asset_generator/l10n/app_localizations.dart';
import '../core/bloc/language/language_cubit.dart';
import '../core/bloc/language/language_state.dart';
import '../core/bloc/theme/theme_cubit.dart';
import '../core/bloc/theme/theme_state.dart';
import '../core/extensions/context_extension.dart';
import '../core/routing/app_router.dart';
import 'home/home/bloc/home_bloc.dart';
import 'user_profile/home/bloc/home_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<HomeHomeBloc>(create: (_) => HomeHomeBloc()),
        BlocProvider<UserProfileHomeBloc>(create: (_) => UserProfileHomeBloc()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (BuildContext context, LanguageState languageState) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                themeMode: themeState.themeMode,
                theme: themeState.themeData,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: languageState.supportedLocales,
                locale: languageState.locale,
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: context.mediaQuery.copyWith(
                      textScaler: TextScaler.noScaling,
                    ),
                    child: child ?? const SizedBox.shrink(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
