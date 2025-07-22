import 'package:equatable/equatable.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeInitialEvent extends HomeEvent {
  const HomeInitialEvent();
}

final class HomeLikeMovieEvent extends HomeEvent {
  const HomeLikeMovieEvent({required this.movieId});

  final String movieId;

  @override
  List<Object?> get props => [movieId];
}

final class HomeFetchMoviesEvent extends HomeEvent {
  const HomeFetchMoviesEvent();

  @override
  List<Object?> get props => [];
}

final class HomeMovieShowEvent extends HomeEvent {
  const HomeMovieShowEvent({required this.movie});

  final MovieModel movie;

  @override
  List<Object?> get props => [movie];
}
