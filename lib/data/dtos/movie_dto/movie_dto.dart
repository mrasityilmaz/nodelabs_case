import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vexana/vexana.dart';

part 'movie_dto.mapper.dart';

@immutable
@MappableClass(
  caseStyle: CaseStyle.pascalCase,
)
class MovieDTO extends INetworkModel<MovieDTO> with MovieDTOMappable {
  const MovieDTO({
    this.id,
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.posterUrl,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.response,
    this.images,
    this.comingSoon,
    this.isFavorite,
  });

  @MappableField(key: 'id')
  final String? id;
  final String? title;
  final String? year;
  final String? rated;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? awards;
  @MappableField(key: 'Poster')
  final String? posterUrl;

  final String? metascore;
  @MappableField(key: 'imdbRating')
  final String? imdbRating;
  @MappableField(key: 'imdbVotes')
  final String? imdbVotes;
  @MappableField(key: 'imdbID')
  final String? imdbID;
  final String? type;
  final String? response;
  final List<String>? images;
  final bool? comingSoon;
  @MappableField(key: 'isFavorite')
  final bool? isFavorite;

  static const fromJsonString = MovieDTOMapper.fromJsonString;
  static const fromJsonStatic = MovieDTOMapper.fromJson;

  @override
  MovieDTO fromJson(Map<String, dynamic> json) {
    return MovieDTOMapper.fromJson(json);
  }
}
