part of '../../../repositories/movie_repository_impl.dart';

/// {@template MovieRemoteDataSource}
/// Interface for remote API operations related to movie.
///
/// This data source interface defines methods for movie-related
/// operations that interact with remote APIs, such as movie list,
/// movie detail, and movie favorite.
/// {@endtemplate}
@visibleForTesting
abstract class MovieRemoteDataSource {
  /// {@template MovieRemoteDataSource.getMovieList}
  /// Get the movie list.
  /// {@endtemplate}
  Future<EitherOr<MovieListDTO>> getMovieList({int page = 1});

  /// {@template MovieRemoteDataSource.toggleFavoriteMovie}
  /// Toggle the favorite movie.
  /// {@endtemplate}
  Future<EitherOr<bool>> toggleFavoriteMovie(String movieId);

  /// {@template MovieRemoteDataSource.getFavoriteMovies}
  /// Get the favorite movies.
  /// {@endtemplate}
  Future<EitherOr<List<MovieDTO>>> getFavoriteMovies();
}
