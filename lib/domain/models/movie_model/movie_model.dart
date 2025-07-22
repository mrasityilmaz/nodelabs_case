import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/data/dtos/movie_dto/movie_dto.dart';

@immutable
final class MovieModel extends MovieDTO {
  const MovieModel({
    super.id,
    super.title,
    super.year,
    super.rated,
    super.released,
    super.runtime,
    super.genre,
    super.director,
    super.writer,
    super.actors,
    super.plot,
    super.language,
    super.country,
    super.awards,
    super.posterUrl,
    super.metascore,
    super.imdbRating,
    super.imdbVotes,
    super.imdbID,
    super.type,
    super.response,
    super.images,
    super.comingSoon,
    bool super.isFavorite = false,
  });

  factory MovieModel.fromDTO(MovieDTO dto) {
    return MovieModel(
      id: dto.id,
      title: dto.title,
      year: dto.year,
      rated: dto.rated,
      released: dto.released,
      runtime: dto.runtime,
      genre: dto.genre,
      director: dto.director,
      writer: dto.writer,
      actors: dto.actors,
      plot: dto.plot,
      language: dto.language,
      country: dto.country,
      awards: dto.awards,
      posterUrl: dto.posterUrl,
      metascore: dto.metascore,
      imdbRating: dto.imdbRating,
      imdbVotes: dto.imdbVotes,
      imdbID: dto.imdbID,
      type: dto.type,
      response: dto.response,
      images: dto.images,
      comingSoon: dto.comingSoon,
      isFavorite: dto.isFavorite ?? false,
    );
  }

  String? getNextPosterUrl(String? currentPosterUrl) {
    return images?.firstWhereOrNull((url) => url != currentPosterUrl);
  }
}
