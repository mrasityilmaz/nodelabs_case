import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';

@immutable
final class ProjectBlocObserver extends BlocObserver with ClassLoggerMixin {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    try {
      if (change.nextState.toJson != null) {
        final json = change.nextState.toJson();
        logJson(
          message: json,
          prefix: '${bloc.runtimeType}|${change.nextState.runtimeType}:',
          stackTrace: StackTrace.current,
        );
      } else {
        logInfo('${bloc.runtimeType}|${change.nextState.runtimeType}: ${change.nextState}');
      }
    } catch (e) {}
  }
}
