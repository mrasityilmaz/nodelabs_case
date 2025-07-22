import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';

@immutable
final class AppRouterObserver extends AutoRouterObserver with ClassLoggerMixin {
  factory AppRouterObserver.create() => AppRouterObserver._();
  AppRouterObserver._() {
    instanceInitialized();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logInfo(
      previousRoute != null
          ? 'Previous route: ${previousRoute.settings.name} --> New route pushed: ${route.settings.name}'
          : 'New route pushed: ${route.settings.name}',
    );
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logInfo(
      previousRoute != null
          ? 'Previous route: ${previousRoute.settings.name} --> Route popped: ${route.settings.name}'
          : 'Route popped: ${route.settings.name}',
    );
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logInfo(
      previousRoute != null
          ? 'Previous route: ${previousRoute.settings.name} --> Route removed: ${route.settings.name}'
          : 'Route removed: ${route.settings.name}',
    );
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    logInfo(
      oldRoute != null
          ? 'Previous route: ${oldRoute.settings.name} --> Route replaced: ${newRoute?.settings.name} | Old route: ${oldRoute.settings.name}'
          : 'Route replaced: ${newRoute?.settings.name} --> Old route: ${oldRoute?.settings.name}',
    );
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
