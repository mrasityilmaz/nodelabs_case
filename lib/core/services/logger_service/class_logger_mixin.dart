import 'package:logger/logger.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/logger_service.dart';

mixin ClassLoggerMixin on Object {
  /// Log an informational message.
  /// The class name will be automatically prepended.
  void logInfo(String message) {
    LoggerService.instance.log(
      Level.info,
      "[$runtimeType] $message",
    );
  }

  /// Log a warning message.
  void logWarning(String message) {
    LoggerService.instance.log(
      Level.warning,
      "[$runtimeType] $message",
    );
  }

  /// Log an error message with an error object and stack trace.
  void logError(String message, {Object? error, StackTrace? stackTrace}) {
    LoggerService.instance.log(
      Level.error,
      "[$runtimeType] $message",
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a debug message.
  void logDebug(String message) {
    LoggerService.instance.log(
      Level.debug,
      "[$runtimeType] $message",
    );
  }

  void logJson({
    required Object? message,
    String prefix = '',
    StackTrace? stackTrace,
  }) {
    LoggerService.instance.jsonLog(
      message: message,
      prefix: prefix,
      stackTrace: stackTrace,
    );
  }

  /// Logs that the instance has been initialized.
  /// Call this at the end of the constructor.
  void instanceInitialized() {
    LoggerService.instance.log(
      Level.info,
      "[$runtimeType] Initialized",
    );
  }
}
