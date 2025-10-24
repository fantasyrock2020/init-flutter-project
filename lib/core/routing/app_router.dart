import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router_observer.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static final GoRouterObserver _routeObserver = GoRouterObserver();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    observers: <NavigatorObserver>[
      _routeObserver,
    ],
    routes: <RouteBase>[
      
    ],
  );
}
