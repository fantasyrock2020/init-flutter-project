import 'package:flutter/material.dart';

import '../core/extensions/context_extension.dart';
import '../core/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: context.mediaQuery.copyWith(
            textScaler: TextScaler.noScaling,
          ), 
          child: child ?? const SizedBox.shrink(),
        );
      }
    );
  }
}
