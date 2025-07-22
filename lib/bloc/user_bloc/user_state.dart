import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_movie_case/domain/models/user_model/user_model.dart';

part 'user_state.mapper.dart';

@MappableClass(
  generateMethods: GenerateMethods.copy | GenerateMethods.encode,
)
class UserState extends Equatable with UserStateMappable {
  const UserState({
    this.user,
    this.isLoading = false,
    this.error,
    this.selectedImagePath,
  });

  final UserModel? user;
  final bool isLoading;
  final String? error;

  final String? selectedImagePath;

  @override
  List<Object?> get props => [user, isLoading, error, selectedImagePath];

  bool get isAuthenticated => user != null;
  bool get hasError => error != null;

  UserState toLoading() => copyWith(
        isLoading: true,
        error: null,
      );
  UserState toError(String error) => copyWith(
        error: error,
        isLoading: false,
      );
  UserState toAuthenticated(UserModel user) => copyWith(
        user: user,
        isLoading: false,
        error: null,
      );
  UserState toSuccessfullyLoadedProfile(UserModel user) => UserSuccessfullyUpdatedProfilePhotoState(
        user: user,
      );
  UserState toUnauthenticated() => copyWith(
        user: null,
        isLoading: false,
        error: null,
      );
  UserState toRegistered() => const UserSuccessfullyRegisteredState();

  UserState toSelectedImage(String? imagePath) => copyWith(
        selectedImagePath: imagePath,
      );

  UserState stopBusy() => copyWith(
        isLoading: false,
        error: null,
        selectedImagePath: null,
      );
}

class UserSuccessfullyRegisteredState extends UserState {
  const UserSuccessfullyRegisteredState();
}

class UserSuccessfullyUpdatedProfilePhotoState extends UserState {
  const UserSuccessfullyUpdatedProfilePhotoState({super.user});
}
