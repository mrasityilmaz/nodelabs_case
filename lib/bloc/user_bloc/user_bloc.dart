import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_event.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_state.dart';
import 'package:nodelabs_movie_case/core/services/image_picker_service.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';
import 'package:nodelabs_movie_case/domain/models/user_model/user_model.dart';
import 'package:nodelabs_movie_case/domain/repositories/user_repository.dart';
import 'package:nodelabs_movie_case/services/token_service.dart';

final class UserBloc extends Bloc<UserEvent, UserState> with ChangeNotifier, ClassLoggerMixin {
  factory UserBloc.create(UserRepository userRepository, TokenService tokenService) =>
      UserBloc._(userRepository, tokenService);

  UserBloc._(this._userRepository, this._tokenService) : super(const UserState()) {
    on<UserEvent>(
      (event, emit) {
        return switch (event) {
          UserInitializeRequested() => _onInitialize(event, emit),
          UserLoginRequested() => _onLogin(event, emit),
          UserRegisterRequested() => _onRegister(event, emit),
          UserLogoutRequested() => _onLogout(event, emit),
          UserProfileLoadRequested() => _onProfileLoad(event, emit),
          UserPhotoUpdateRequested() => _onPhotoUpdate(event, emit),
        };
      },
      transformer: sequential(),
    );

    instanceInitialized();

    // App başladığında otomatik auth check
    add(const UserInitializeRequested());
  }

  final UserRepository _userRepository;
  final TokenService _tokenService;

  //
  // MARK: [UserInitializeRequested]
  //

  Future<void> _onInitialize(UserInitializeRequested event, Emitter<UserState> emit) async {
    emit(state.toLoading());

    try {
      await _tokenService.syncTokensFromLocalStorage();

      if (!_tokenService.hasAccessToken) {
        logInfo('No token found - user unauthenticated');
        emit(state.toUnauthenticated());
        return;
      }

      logInfo('Token found - loading user profile');

      final userResult = await _userRepository.getProfile();

      userResult.fold(
        (error) {
          logInfo('${error.errorMessage} - user unauthenticated');
          emit(state.toUnauthenticated());
        },
        (user) {
          logInfo('User authenticated successfully');
          emit(state.toAuthenticated(user));
        },
      );
    } catch (e, s) {
      logError('Auth initialization failed $e', error: e, stackTrace: s);
      emit(state.toUnauthenticated());
    }
  }

  //
  // MARK: [UserLoginRequested]
  //

  Future<void> _onLogin(UserLoginRequested event, Emitter<UserState> emit) async {
    emit(state.toLoading());

    try {
      logInfo('Login attempt for: ${event.email}');

      final result = await _userRepository.login(
        email: event.email,
        password: event.password,
      );

      await result.fold(
        (error) {
          logError('Login failed: ${error.errorMessage}');
          emit(state.toError(error.errorMessage ?? 'Login failed'));
        },
        (user) async {
          if (user.token != null) {
            await _tokenService.writeAccessToken(user.token!);
            logInfo('Login successful - user authenticated');
            emit(state.toAuthenticated(user));
          } else {
            emit(state.toError('Invalid token received'));
          }
        },
      );
    } catch (e, s) {
      logError('Login error', error: e, stackTrace: s);
      emit(state.toError('Login failed $e'));
    }
  }

  //
  // MARK: [UserRegisterRequested]
  //

  Future<void> _onRegister(UserRegisterRequested event, Emitter<UserState> emit) async {
    emit(state.toLoading());

    try {
      logInfo('Register attempt for: ${event.email}');

      final result = await _userRepository.register(
        name: event.name,
        email: event.email,
        password: event.password,
      );

      await result.fold(
        (error) {
          logError('Register failed: ${error.errorMessage}');
          emit(state.toError(error.errorMessage ?? 'Registration failed'));
        },
        (user) async {
          logInfo('Registration successful - user authenticated');
          emit(state.toRegistered());
        },
      );
    } catch (e, s) {
      logError('Register error', error: e, stackTrace: s);
      emit(state.toError('Registration failed $e'));
    }
  }

  //
  // MARK: [UserLogoutRequested]
  //

  Future<void> _onLogout(UserLogoutRequested event, Emitter<UserState> emit) async {
    emit(state.toLoading());

    try {
      await _tokenService.deleteAccessToken();
      emit(state.toUnauthenticated());
    } catch (e, s) {
      logError('Logout error', error: e, stackTrace: s);
      emit(state.toError('Logout failed $e'));
    }
  }

  //
  // MARK: [UserProfileLoadRequested]
  //

  Future<void> _onProfileLoad(UserProfileLoadRequested event, Emitter<UserState> emit) async {
    if (!state.isAuthenticated) return;

    emit(state.toLoading());

    try {
      final result = await _userRepository.getProfile();

      result.fold(
        (error) => emit(state.toError(error.errorMessage ?? 'Profile load failed')),
        (user) => emit(state.toSuccessfullyLoadedProfile(user)),
      );
    } catch (e, s) {
      logError('Profile load error', error: e, stackTrace: s);
      emit(state.toError('Profile load failed $e'));
    }
  }

  //
  // MARK: [UserPhotoUpdateRequested]
  //

  Future<void> _onPhotoUpdate(UserPhotoUpdateRequested event, Emitter<UserState> emit) async {
    final currentState = state;
    if (!currentState.isAuthenticated) return;

    emit(currentState.toLoading());
    final imagePicker = ImagePickerService();

    try {
      final image = await imagePicker.pickImage(ImagePickSizeEnum.profileImage);
      if (image == null) return;

      emit(currentState.toSelectedImage(image.path));

      final result = await _userRepository.updateProfilePhoto(image);

      result.fold(
        (error) {
          emit(currentState.toError(error.errorMessage ?? 'Photo update failed'));
        },
        (photoUrl) {
          // Update current user with new photo
          final updatedUser = currentState.user!.copyWith(photoUrl: photoUrl);
          emit(
            state.toSuccessfullyLoadedProfile(
              UserModel.fromDTO(updatedUser),
            ),
          );
        },
      );
    } catch (e, s) {
      logError('Photo update error', error: e, stackTrace: s);
      emit(currentState.toError('Photo update failed $e'));
    } finally {
      emit(currentState.stopBusy());
    }
  }
}
