import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/config/api/requests/movie_requests.dart';
import 'package:nodelabs_movie_case/core/extensions/api_extension.dart';
import 'package:nodelabs_movie_case/core/extensions/dartz_extension.dart';
import 'package:nodelabs_movie_case/data/dtos/core_mappers/list_result_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/movie_dto/movie_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/movie_dto/movie_list_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/raw_response_dto/raw_response_dto.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_list_model.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';
import 'package:nodelabs_movie_case/domain/repositories/movie_repository.dart';
import 'package:nodelabs_movie_case/services/network_manager/network_manager.dart';

part '../datasources/movie_datasources/remote/movie_remote_data_source.dart';
part '../datasources/movie_datasources/remote/movie_remote_data_source_impl.dart';

@immutable
final class MovieRepositoryImpl extends MovieRepository {
  const MovieRepositoryImpl(this._remoteDataSource);
  final MovieRemoteDataSource _remoteDataSource;

  @override
  Future<EitherOr<List<MovieModel>>> getFavoriteMovies() async {
    return _remoteDataSource.getFavoriteMovies().then((value) {
      return value.fold(Left.new, (r) {
        return Right(r.map((e) => MovieModel.fromDTO(e)).toList());
      });
    });
  }

  @override
  Future<EitherOr<MovieListModel>> getMovieList({int page = 1}) async {
    return _remoteDataSource.getMovieList(page: page).then((value) {
      return value.fold(Left.new, (r) {
        return Right(MovieListModel.fromDTO(r));
      });
    });
  }

  @override
  Future<EitherOr<bool>> toggleFavoriteMovie(String movieId) async {
    return _remoteDataSource.toggleFavoriteMovie(movieId).then((value) {
      return value.fold(Left.new, (r) {
        return Right(r);
      });
    });
  }
}
