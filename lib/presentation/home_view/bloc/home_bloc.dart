import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';
import 'package:nodelabs_movie_case/domain/repositories/movie_repository.dart';
import 'package:nodelabs_movie_case/presentation/home_view/bloc/home_event.dart';
import 'package:nodelabs_movie_case/presentation/home_view/bloc/home_state.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_bloc.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_event.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(throttleDuration), mapper);
  };
}

final class HomeBloc extends Bloc<HomeEvent, HomeState> with ClassLoggerMixin {
  HomeBloc(this._movieRepository, this._profileBloc) : super(HomeState.initial()) {
    on<HomeEvent>(
      (event, emit) {
        return switch (event) {
          HomeInitialEvent() => _onInitialEvent(event, emit),
          HomeFetchMoviesEvent() => _onFetchMoviesEvent(event, emit),
          HomeLikeMovieEvent() => _onLikeMovieEvent(event, emit),
          HomeMovieShowEvent() => _onMovieShowEvent(event, emit),
          _ => null,
        };
      },
      transformer: throttleDroppable(throttleDuration),
    );

    add(const HomeInitialEvent());
  }

  //
  // MARK: - DEPENDENCIES
  //

  final MovieRepository _movieRepository;
  final ProfileBloc _profileBloc;

  //
  // MARK: - VARIABLES
  //
  final EasyRefreshController easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  //
  // MARK: - EVENTS
  //

  Future<void> _onInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final result = await _movieRepository.getMovieList();
      result.fold(
        (l) => emit(state.onError(l.errorMessage)),
        (r) {
          emit(state.mergeMovies(r, isInitial: true));
          if (r.movies.firstOrNull != null) {
            emit(state.onMovieShowing(r.movies.first));
          }
        },
      );
    } catch (e, s) {
      logError(
        'HomeBloc: _onInitialEvent: $e',
        error: e,
        stackTrace: s,
      );
      emit(state.onError(e.toString()));
    } finally {
      emit(state.stopBusy());
      easyRefreshController.finishRefresh();
    }
  }

  Future<void> _onFetchMoviesEvent(HomeFetchMoviesEvent event, Emitter<HomeState> emit) async {
    try {
      if (!state.hasMore) return;

      emit(state.copyWith(isLoadingMore: true));
      logInfo('HomeBloc: _onFetchMoviesEvent: Fetching page ${(state.movies.pagination?.currentPage ?? 1) + 1}');
      final result = await _movieRepository.getMovieList(
        page: (state.movies.pagination?.currentPage ?? 1) + 1,
      );
      result.fold(
        (l) => emit(state.onError(l.errorMessage)),
        (r) {
          emit(state.mergeMovies(r));
          logJson(message: r.pagination?.toJson(), prefix: 'HomeBloc: _onFetchMoviesEvent: Fetched page');
        },
      );
    } catch (e, s) {
      logError('HomeBloc: _onFetchMoviesEvent: $e', error: e, stackTrace: s);
      emit(state.onError(e.toString()));
    } finally {
      emit(state.stopBusy());
      easyRefreshController.finishLoad();
    }
  }

  Future<void> _onLikeMovieEvent(HomeLikeMovieEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(isLikeBusy: true));
      final result = await _movieRepository.toggleFavoriteMovie(event.movieId);
      result.fold(
        (l) => emit(state.onError(l.errorMessage)),
        (r) {
          emit(state.onLikeMovie(event.movieId, r));
          _profileBloc.add(const ProfileInitialEvent());
        },
      );
    } catch (e, s) {
      logError('HomeBloc: _onLikeMovieEvent: $e', error: e, stackTrace: s);
      emit(state.onError(e.toString()));
    } finally {
      emit(state.stopBusy());
    }
  }

  void _onMovieShowEvent(HomeMovieShowEvent event, Emitter<HomeState> emit) {
    emit(state.onMovieShowing(event.movie));
  }

  @override
  Future<void> close() {
    easyRefreshController.dispose();
    return super.close();
  }
}
