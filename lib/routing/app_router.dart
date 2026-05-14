import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';
import 'app_routes.dart';
import 'router_observer.dart';

class AppRouter {
  AppRouter._();

  static final GoRouterObserver _routeObserver = GoRouterObserver();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    observers: <NavigatorObserver>[_routeObserver],
    initialLocation: AppRoutes.home,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeHomePage();
        },
      ),
    ],
  );
}
