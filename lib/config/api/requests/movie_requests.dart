import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/config/api/api_paths.dart';
import 'package:nodelabs_movie_case/data/dtos/core_mappers/list_result_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/movie_dto/movie_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/movie_dto/movie_list_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/pagination_dto/pagination_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/raw_response_dto/raw_response_dto.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_request_model.dart';

@immutable
final class ToggleMovieFavoriteRequest extends BaseRequestModel<RawResponseDTO> {
  ToggleMovieFavoriteRequest({required this.favoriteId, super.apiPath = ApiPaths.toggleMovieFavorite})
      : super(
          path: apiPath.path.replaceAll('{movieId}', favoriteId),
          requestMethod: apiPath.requestType,
          parseModel: const RawResponseDTO(),
          headers: apiPath.defaultHeaders,
        );

  final String favoriteId;
}

@immutable
final class GetFavoriteMoviesRequest extends BaseRequestModel<ListResultDTO<MovieDTO>> {
  GetFavoriteMoviesRequest({super.apiPath = ApiPaths.favoriteMovies})
      : super(
          path: apiPath.path,
          requestMethod: apiPath.requestType,
          parseModel: const ListResultDTO<MovieDTO>(
            data: [],
            itemFromJson: MovieDTO.fromJsonStatic,
          ),
          headers: apiPath.defaultHeaders,
        );
}

@immutable
final class GetMovieListRequest extends BaseRequestModel<MovieListDTO> {
  GetMovieListRequest({super.apiPath = ApiPaths.movieList, this.page = 1})
      : super(
          path: apiPath.path,
          requestMethod: apiPath.requestType,
          parseModel: const MovieListDTO(
            pagination: PaginationDTO(),
          ),
          headers: apiPath.defaultHeaders,
          queryParameters: {
            'page': page,
          },
        );

  final int page;
}
