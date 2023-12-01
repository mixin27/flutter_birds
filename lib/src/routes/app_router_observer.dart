// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

class AppRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('Route popped: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log(
      'Route replaced: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}',
    );
  }
}
