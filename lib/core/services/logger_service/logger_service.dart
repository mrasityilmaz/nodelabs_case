import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final class LoggerService extends Logger {
  static LoggerService? _instance;
  static LoggerService get instance {
    _instance ??= LoggerService._();
    return _instance!;
  }

  LoggerService._()
      : super(
          filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
          output: MultiOutput([
            if (kDebugMode) ...[
              ConsoleOutput(),
              memoryOutput,
            ] else ...[
              memoryOutput,
            ],
          ]),
          printer: PrefixPrinter(
            PrettyPrinter(
              colors: false,
              errorMethodCount: 4,
              methodCount: 2,
              stackTraceBeginIndex: 1,
              dateTimeFormat: (time) => time.toIso8601String(),
              levelColors: {
                Level.debug: AnsiColor.fg(Colors.blue.value),
                Level.info: AnsiColor.fg(Colors.green.value),
                Level.warning: AnsiColor.fg(Colors.yellow.value),
                Level.error: AnsiColor.fg(Colors.red.value),
              },
            ),
          ),
        );

  static final MemoryOutput memoryOutput = MemoryOutput(bufferSize: 100);

  void reportLog(Object? e, StackTrace? s, [String? context, String? extraData]) {
    if (kDebugMode) {
      this.e("CatchLogged.${context ?? ''}: $e", error: e, stackTrace: s, time: DateTime.now());
    } else {
      // TODO - Send error to crashlytics or something else
    }
  }

  void jsonLog({
    required Object? message,
    String prefix = '',
    StackTrace? stackTrace,
  }) {
    i(
      '$prefix: ${const JsonEncoder.withIndent('\t').convert(message)}',
      stackTrace: stackTrace ?? StackTrace.current,
      time: DateTime.now(),
    );
  }

  @override
  @protected
  Future<void> close() {
    return super.close();
  }

  @override
  @protected
  Future<void> get init => super.init;

  @protected
  void dispose() {
    close();
  }
}
