import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_list_model.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';

part 'home_state.mapper.dart';

@immutable
@MappableClass(
  generateMethods: GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.encode,
)
final class HomeState extends Equatable with HomeStateMappable {
  const HomeState({
    required this.movies,
    required this.isLoading,
    required this.isLikeBusy,
    required this.isLoadingMore,
    this.currentMovie,
    this.error,
  });

  factory HomeState.initial() => const HomeState(
        movies: MovieListModel(),
        isLoading: false,
        isLoadingMore: false,
        isLikeBusy: false,
      );

  HomeState stopBusy() => copyWith(
        isLoading: false,
        isLoadingMore: false,
        isLikeBusy: false,
        error: null,
      );

  HomeState onError(String? error) => copyWith(
        error: error,
        isLoading: false,
        isLoadingMore: false,
        isLikeBusy: false,
      );

  HomeState onMovieShowing(MovieModel movie) => copyWith(
        currentMovie: movie,
      );

  HomeState onLikeMovie(String movieId, bool isFavorite) => copyWith(
        currentMovie: currentMovie != null
            ? MovieModel.fromDTO(
                currentMovie!.copyWith(isFavorite: isFavorite),
              )
            : null,
        movies: MovieListModel.fromDTO(
          movies.copyWith(
            movies: movies.movies.map((e) {
              if (e.id == movieId) {
                return e.copyWith(isFavorite: isFavorite);
              }
              return e;
            }).toList(),
          ),
        ),
      );

  HomeState mergeMovies(MovieListModel fetchedMovies, {bool isInitial = false}) => copyWith(
        movies: isInitial
            ? fetchedMovies
            : MovieListModel.fromDTO(
                movies.copyWith(
                  movies: [...movies.movies, ...fetchedMovies.movies],
                  pagination: fetchedMovies.pagination,
                ),
              ),
        isLoading: false,
        isLoadingMore: false,
        isLikeBusy: false,
        error: null,
      );

  final MovieListModel movies;
  final MovieModel? currentMovie;
  final bool isLoading;
  final bool isLikeBusy;
  final bool isLoadingMore;
  final String? error;

  bool get hasReachedEnd => movies.hasReachedEnd;
  bool get hasMore => movies.hasMore;

  static const int moviesPerPage = 5;

  @override
  List<Object?> get props => [
        movies,
        currentMovie,
        isLikeBusy,
        isLoading,
        isLoadingMore,
        error,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson()..removeWhere((key, value) => key == 'movies' || key == 'current_movie'),
      'movies': movies.movies.map((e) => '${e.id}|${e.title}|${e.isFavorite == true ? '👍' : '👎'}').toList(),
      'current_movie': currentMovie != null
          ? '${currentMovie!.id}|${currentMovie!.title}|${currentMovie!.isFavorite == true ? '👍' : '👎'}'
          : null,
    };
  }
}
