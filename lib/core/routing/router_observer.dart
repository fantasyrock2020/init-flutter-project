import 'package:flutter/material.dart';

import '../services/logger_service.dart';

class GoRouterObserver extends NavigatorObserver with LoggerService {
  String? currentRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final String routeName = _getRouteName(route);
    logInfo('[Go Router] didPush: $routeName');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final String routeName = _getRouteName(route);
    logInfo('[Go Router] didPop: $routeName');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final String routeName = _getRouteName(route);
    logInfo('[Go Router] didRemove: $routeName');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final String newRouteName = newRoute != null
        ? _getRouteName(newRoute)
        : 'null';
    final String oldRouteName = oldRoute != null
        ? _getRouteName(oldRoute)
        : 'null';
    logInfo('[Go Router] didReplace: $oldRouteName -> $newRouteName');
  }

  String _getRouteName(Route<dynamic> route) {
    try {
      // Handle GoRoute specifically
      if (route is PageRoute) {
        final String? routeName = route.settings.name;
        if (routeName != null && routeName.isNotEmpty) {
          currentRoute = routeName;
          return routeName;
        }
      }

      // Fallback to a safer string representation
      final String routeString = route.toString();

      // Extract just the route path if it's a MaterialPageRoute
      if (routeString.contains('MaterialPage')) {
        final RegExp pathRegex = RegExp(r'MaterialPage<[^>]*>\("([^"]*)"');
        final Match? match = pathRegex.firstMatch(routeString);
        if (match != null) {
          return match.group(1) ?? routeString;
        }
      }

      return route.runtimeType.toString();
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return 'Unknown Route';
    }
  }
}
