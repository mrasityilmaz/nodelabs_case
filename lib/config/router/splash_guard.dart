import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';

@immutable
class SplashGuard extends AutoRouteGuard with ClassLoggerMixin {
  SplashGuard(this.userBloc);

  final UserBloc userBloc;

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    logInfo('SplashGuard - Route: ${resolver.routeName}');

    // Current state'i al
    final currentState = userBloc.state;

    // Loading ise state değişimini bekle
    if (currentState.isLoading) {
      await userBloc.stream.firstWhere((state) => !state.isLoading);
      _removeSplash();
      final finalState = userBloc.state;

      if (finalState.isAuthenticated) {
        // Authenticated - Main'a yönlendir
        if (resolver.routeName != MainRoute.name) {
          await router.pushAndPopUntil(const MainRoute(), predicate: (route) => false);
        } else {
          resolver.next();
        }
      } else {
        // Unauthenticated - Public route'daysa devam et, değilse login'e git
        if (_publicRoutes.contains(resolver.routeName)) {
          resolver.next();
        } else {
          await router.pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
        }
      }
    } else if (currentState.isAuthenticated) {
      _removeSplash();
      // Zaten authenticated - Main'a yönlendir
      if (resolver.routeName != MainRoute.name) {
        await router.pushAndPopUntil(const MainRoute(), predicate: (route) => false);
      } else {
        resolver.next();
      }
    } else {
      _removeSplash();
      // Unauthenticated - Public route'daysa devam et, değilse login'e git
      if (_publicRoutes.contains(resolver.routeName)) {
        resolver.next();
      } else {
        await router.pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
      }
    }
  }

  void _removeSplash() {
    try {
      FlutterNativeSplash.remove();
    } catch (e) {
      logError('Failed to remove splash: $e');
    }
  }

  List<String> get _publicRoutes => [
        LoginRoute.name,
        RegisterRoute.name,
      ];
}
