import 'package:nodelabs_movie_case/core/extensions/dartz_extension.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_list_model.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';

abstract class MovieRepository {
  const MovieRepository();
  //
  // MARK: - REMOTE OPERATIONS
  // Just the remote data source operations are defined here.
  //

  ///{@macro MovieRemoteDataSource.getMovieList}
  Future<EitherOr<MovieListModel>> getMovieList({int page = 1});

  ///{@macro MovieRemoteDataSource.toggleFavoriteMovie}
  Future<EitherOr<bool>> toggleFavoriteMovie(String movieId);

  ///{@macro MovieRemoteDataSource.getFavoriteMovies}
  Future<EitherOr<List<MovieModel>>> getFavoriteMovies();
}
