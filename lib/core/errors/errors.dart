import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/core/extensions/dartz_extension.dart';
import 'package:nodelabs_movie_case/data/dtos/base_response_dto/base_response_dto.dart';

sealed class CustomException extends Equatable implements Exception {
  const CustomException({
    this.error,
    this.stackTrace,
    this.errorMessage = 'An error occurred',
    this.showSnackBar = false,
    this.properties = const [],
  });
  final List<Object?> properties;
  final bool showSnackBar;
  final String? errorMessage;
  final Object? error;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [errorMessage, error, stackTrace, showSnackBar, ...properties];

  static EitherOr<T> fromError<T>(Object error, StackTrace stackTrace) {
    return switch (error) {
      CustomException() => Left(error),
      _ => Left(UnExpectedException(error: error, stackTrace: stackTrace)),
    };
  }
}

/// This exception used when the network request fails.
/// [showSnackBar] is set to `true` by default.
///
@immutable
final class NetworkException extends CustomException {
  NetworkException({
    super.error,
    super.stackTrace,
    super.showSnackBar = true,
  }) : super(
          properties: [
            showSnackBar,
            error,
            stackTrace,
          ],
        );
}

/// This exception used when the cache operation fails.
/// [errorMessage] is the error message that will be shown to the user.
/// [showSnackBar] is set to `false` by default.
@immutable
final class CacheException extends CustomException {
  CacheException({super.error, super.stackTrace, super.errorMessage, super.showSnackBar = false})
      : super(properties: [errorMessage, showSnackBar, error, stackTrace]);
}

/// This exception usually used when the user tries to do an operation that is not allowed.
/// [errorMessage] is the error message that will be shown to the user.
/// [showSnackBar] is set to `true` by default.
/// [data] is the data that will be passed to the error message.
@immutable
final class UnExpectedException extends CustomException {
  UnExpectedException({super.error, super.stackTrace, super.errorMessage, this.data, super.showSnackBar = true})
      : super(properties: [errorMessage, data, showSnackBar, error, stackTrace]);

  final dynamic data;
}

/// This exception used when the data is empty.
/// [errorMessage] is the error message that will be shown to the user.
/// [showSnackBar] is set to `true` by default.

@immutable
final class EmptyDataException extends CustomException {
  EmptyDataException({
    super.error,
    super.stackTrace,
    super.errorMessage = 'Any data not found',
    super.showSnackBar = true,
  }) : super(properties: [errorMessage, showSnackBar, error, stackTrace]);
}

@immutable
final class BaseApiException extends CustomException {
  BaseApiException({
    required this.statusCode,
    this.error,
    super.stackTrace,
    super.errorMessage = 'An error occurred',
    super.showSnackBar = false,
  }) : super(properties: [errorMessage, showSnackBar, error, stackTrace, statusCode]);

  final int statusCode;

  @override
  final BaseResponseDTO? error;
}
