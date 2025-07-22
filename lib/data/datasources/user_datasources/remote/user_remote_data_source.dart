part of '../../../repositories/user_repository_impl.dart';

/// {@template UserRemoteDataSource}
/// Interface for remote API operations related to user.
///
/// This data source interface defines methods for user-related
/// operations that interact with remote APIs, such as user registration,
/// login, and logout processes.
/// {@endtemplate}
@visibleForTesting
abstract class UserRemoteDataSource {
  /// {@template UserRemoteDataSource.login}
  /// Login to the system.
  /// {@endtemplate}
  Future<EitherOr<UserDTO>> login({required String email, required String password});

  /// {@template UserRemoteDataSource.register}
  /// Register a new user.
  /// {@endtemplate}
  Future<EitherOr<UserDTO>> register({required String email, required String password, required String name});

  /// {@template UserRemoteDataSource.getProfile}
  /// Get the user's profile and token.
  /// {@endtemplate}
  Future<EitherOr<UserDTO>> getProfile();

  /// {@template UserRemoteDataSource.updateProfilePhoto}
  /// Update the user's profile photo.
  /// {@endtemplate}
  Future<EitherOr<String>> updateProfilePhoto(XFile photo);
}
