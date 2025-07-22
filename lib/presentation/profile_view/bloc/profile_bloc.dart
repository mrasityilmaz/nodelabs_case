import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_event.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';
import 'package:nodelabs_movie_case/domain/repositories/movie_repository.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_event.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_state.dart';

final class ProfileBloc extends Bloc<ProfileEvent, ProfileState> with ClassLoggerMixin {
  ProfileBloc(this._movieRepository, this._userBloc) : super(ProfileState.initial()) {
    on<ProfileEvent>(
      (event, emit) {
        return switch (event) {
          ProfileInitialEvent() => _onInitialEvent(event, emit),
          ProfileUploadImageEvent() => _onUploadImageEvent(event, emit),
          _ => null,
        };
      },
      transformer: sequential(),
    );

    add(const ProfileInitialEvent());
    _userBloc.add(const UserProfileLoadRequested());
  }

  //
  // MARK: - DEPENDENCIES
  //

  final MovieRepository _movieRepository;
  final UserBloc _userBloc;

  final EasyRefreshController easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
  );

  //
  // MARK: - EVENTS
  //

  Future<void> _onInitialEvent(ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final result = await _movieRepository.getFavoriteMovies();
      result.fold(
        (l) => emit(state.onError(l.errorMessage)),
        (r) {
          emit(state.onFavoriteMovies(r));
        },
      );
    } catch (e, s) {
      logError(
        'ProfileBloc: _onInitialEvent: $e',
        error: e,
        stackTrace: s,
      );
      emit(state.onError(e.toString()));
    } finally {
      emit(state.stopBusy());
      easyRefreshController.finishRefresh();
    }
  }

  Future<void> _onUploadImageEvent(ProfileUploadImageEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      logInfo('ProfileBloc: _onUploadImageEvent: Uploading image');
      // final result = await _userRepository.uploadImage(event.image);
      // result.fold(
      //   (l) => emit(state.onError(l.errorMessage)),
      //   (r) {
      //     emit(state.mergeMovies(r));
      //     logJson(message: r.pagination?.toJson(), prefix: 'HomeBloc: _onFetchMoviesEvent: Fetched page');
      //   },
      // );
    } catch (e, s) {
      logError('ProfileBloc: _onUploadImageEvent: $e', error: e, stackTrace: s);
      emit(state.onError(e.toString()));
    } finally {
      emit(state.stopBusy());
    }
  }

  @override
  Future<void> close() {
    easyRefreshController.dispose();
    return super.close();
  }
}
