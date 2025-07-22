import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nodelabs_movie_case/data/dtos/movie_dto/movie_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/pagination_dto/pagination_dto.dart';
import 'package:vexana/vexana.dart';

part 'movie_list_dto.mapper.dart';

@immutable
@MappableClass()
class MovieListDTO extends INetworkModel<MovieListDTO> with MovieListDTOMappable {
  const MovieListDTO({
    this.movies = const [],
    this.pagination,
  });

  final List<MovieDTO> movies;
  final PaginationDTO? pagination;

  static const fromJsonString = MovieListDTOMapper.fromJsonString;
  static const fromJsonStatic = MovieListDTOMapper.fromJson;

  @override
  MovieListDTO fromJson(Map<String, dynamic> json) {
    final data = MovieListDTOMapper.fromJson(json);
    return data;
  }
}
