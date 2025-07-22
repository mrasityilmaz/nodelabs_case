part of '../../../repositories/movie_repository_impl.dart';

@visibleForTesting
final class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  MovieRemoteDataSourceImpl(this._networkService);
  final NetworkService _networkService;

  @override
  Future<EitherOr<List<MovieDTO>>> getFavoriteMovies() async {
    final result = await _networkService.sendWithCustomResponse<ListResultDTO<MovieDTO>>(GetFavoriteMoviesRequest());

    return result.fold<EitherOr<List<MovieDTO>>>(
      ifSuccess: (response) {
        return Right(response.data);
      },
      ifError: (error) {
        return Left(error.toBaseApiException(StackTrace.current));
      },
    );
  }

  @override
  Future<EitherOr<MovieListDTO>> getMovieList({int page = 1}) async {
    final result = await _networkService.sendWithCustomResponse<MovieListDTO>(GetMovieListRequest(page: page));

    return result.fold<EitherOr<MovieListDTO>>(
      ifSuccess: (response) {
        return Right(response);
      },
      ifError: (error) {
        return Left(error.toBaseApiException(StackTrace.current));
      },
    );
  }

  @override
  Future<EitherOr<bool>> toggleFavoriteMovie(String movieId) async {
    final result =
        await _networkService.sendWithCustomResponse<RawResponseDTO>(ToggleMovieFavoriteRequest(favoriteId: movieId));

    return result.fold<EitherOr<bool>>(
      ifSuccess: (response) {
        return Right(response.data?['action'] == 'favorited');
      },
      ifError: (error) {
        return Left(error.toBaseApiException(StackTrace.current));
      },
    );
  }
}
