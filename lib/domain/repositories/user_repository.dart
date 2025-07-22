import 'package:image_picker/image_picker.dart';
import 'package:nodelabs_movie_case/core/extensions/dartz_extension.dart';
import 'package:nodelabs_movie_case/domain/models/user_model/user_model.dart';

abstract class UserRepository {
  const UserRepository();
  //
  // MARK: - REMOTE OPERATIONS
  // Just the remote data source operations are defined here.
  //

  ///{@macro UserRemoteDataSource.login}
  Future<EitherOr<UserModel>> login({required String email, required String password});

  ///{@macro UserRemoteDataSource.register}
  Future<EitherOr<UserModel>> register({required String email, required String password, required String name});

  ///{@macro UserRemoteDataSource.getProfile}
  Future<EitherOr<UserModel>> getProfile();

  ///{@macro UserRemoteDataSource.updateProfilePhoto}
  Future<EitherOr<String>> updateProfilePhoto(XFile photo);
}
