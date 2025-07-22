import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodelabs_movie_case/config/api/requests/user_requests.dart';
import 'package:nodelabs_movie_case/core/extensions/api_extension.dart';
import 'package:nodelabs_movie_case/core/extensions/dartz_extension.dart';
import 'package:nodelabs_movie_case/data/dtos/raw_response_dto/raw_response_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/user_dto/user_dto.dart';
import 'package:nodelabs_movie_case/domain/models/user_model/user_model.dart';
import 'package:nodelabs_movie_case/domain/repositories/user_repository.dart';
import 'package:nodelabs_movie_case/services/network_manager/network_manager.dart';

part '../datasources/user_datasources/remote/user_remote_data_source.dart';
part '../datasources/user_datasources/remote/user_remote_data_source_impl.dart';

@immutable
final class UserRepositoryImpl extends UserRepository {
  const UserRepositoryImpl(this._remoteDataSource);
  final UserRemoteDataSource _remoteDataSource;

  @override
  Future<EitherOr<UserModel>> getProfile() async {
    return _remoteDataSource.getProfile().then((value) {
      return value.fold(Left.new, (r) {
        return Right(UserModel.fromDTO(r));
      });
    });
  }

  @override
  Future<EitherOr<UserModel>> login({required String email, required String password}) async {
    return _remoteDataSource
        .login(
      email: email,
      password: password,
    )
        .then((value) {
      return value.fold(Left.new, (r) {
        return Right(UserModel.fromDTO(r));
      });
    });
  }

  @override
  Future<EitherOr<UserModel>> register({required String email, required String password, required String name}) async {
    return _remoteDataSource
        .register(
      email: email,
      password: password,
      name: name,
    )
        .then((value) {
      return value.fold(Left.new, (r) {
        return Right(UserModel.fromDTO(r));
      });
    });
  }

  @override
  Future<EitherOr<String>> updateProfilePhoto(XFile photo) async {
    return _remoteDataSource.updateProfilePhoto(photo).then((value) {
      return value.fold(Left.new, (r) {
        return Right(r);
      });
    });
  }
}
