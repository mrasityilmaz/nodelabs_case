import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/data/dtos/movie_dto/movie_list_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/pagination_dto/pagination_dto.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';

@immutable
final class MovieListModel extends MovieListDTO {
  const MovieListModel({
    this.movies = const [],
    PaginationDTO super.pagination = const PaginationDTO(
      currentPage: 1,
      perPage: 5,
    ),
  });

  factory MovieListModel.fromDTO(MovieListDTO dto) {
    return MovieListModel(
      movies: dto.movies.map(MovieModel.fromDTO).toList(),
      pagination: dto.pagination ??
          const PaginationDTO(
            currentPage: 1,
            perPage: 5,
          ),
    );
  }

  @override
  final List<MovieModel> movies;

  bool get hasMore => (pagination?.currentPage ?? 0) < (pagination?.maxPage ?? 0);

  bool get hasReachedEnd => (pagination?.currentPage ?? 0) >= (pagination?.maxPage ?? 0);
}
