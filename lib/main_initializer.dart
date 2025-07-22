import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nodelabs_movie_case/bloc/bloc_observer.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/logger_service.dart';

@immutable
final class MainInitializer {
  /// Initializes of all the services and dependencies
  static Future<void> initialize() async {
    final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // await ThemeManager.initialise();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    Bloc.observer = ProjectBlocObserver();
    FlutterError.onError = onFlutterError;
  }

  /// When main zone error occurs
  static void onErrorZone(Object error, StackTrace stackTrace) {
    LoggerService.instance.reportLog(error, stackTrace, 'Zone Error');
  }

  /// When Flutter error occurs
  static void onFlutterError(FlutterErrorDetails details) {
    LoggerService.instance.reportLog(
      details.exception,
      details.stack ?? StackTrace.current,
      'Flutter Error',
      details.toString(
        minLevel: DiagnosticLevel.warning,
      ),
    );
  }
}
