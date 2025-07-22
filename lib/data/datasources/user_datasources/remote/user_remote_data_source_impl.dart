part of '../../../repositories/user_repository_impl.dart';

@visibleForTesting
final class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl(this._networkService);
  final NetworkService _networkService;

  @override
  Future<EitherOr<UserDTO>> getProfile() async {
    final result = await _networkService.sendWithCustomResponse<UserDTO>(UserProfileRequest());

    return result.fold<EitherOr<UserDTO>>(
      ifSuccess: (response) {
        return Right(response);
      },
      ifError: (error) {
        return Left(error.toBaseApiException(StackTrace.current));
      },
    );
  }

  @override
  Future<EitherOr<UserDTO>> login({required String email, required String password}) async {
    final result =
        await _networkService.sendWithCustomResponse<UserDTO>(LoginRequest(email: email, password: password));

    return result.fold<EitherOr<UserDTO>>(
      ifSuccess: (response) {
        return Right(response);
      },
      ifError: (error) {
        return Left(error.toBaseApiException(StackTrace.current));
      },
    );
  }

  @override
  Future<EitherOr<UserDTO>> register({required String email, required String password, required String name}) async {
    final result = await _networkService
        .sendWithCustomResponse<UserDTO>(RegisterRequest(email: email, password: password, name: name));

    return result.fold<EitherOr<UserDTO>>(
      ifSuccess: (response) {
        return Right(response);
      },
      ifError: (error) {
        return Left(error.toBaseApiException(StackTrace.current));
      },
    );
  }

  @override
  Future<EitherOr<String>> updateProfilePhoto(XFile photo) async {
    final result =
        await _networkService.sendWithCustomResponse<RawResponseDTO>(UpdateProfilePhotoRequest(photo: photo));

    return result.fold<EitherOr<String>>(
      ifSuccess: (response) {
        return Right(response.data?['photoUrl'] as String);
      },
      ifError: (error) {
        return Left(error.toBaseApiException(StackTrace.current));
      },
    );
  }
}
