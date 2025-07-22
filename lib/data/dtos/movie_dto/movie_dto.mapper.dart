// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'movie_dto.dart';

class MovieDTOMapper extends ClassMapperBase<MovieDTO> {
  MovieDTOMapper._();

  static MovieDTOMapper? _instance;
  static MovieDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MovieDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MovieDTO';

  static String? _$id(MovieDTO v) => v.id;
  static const Field<MovieDTO, String> _f$id = Field('id', _$id, opt: true);
  static String? _$title(MovieDTO v) => v.title;
  static const Field<MovieDTO, String> _f$title =
      Field('title', _$title, key: r'Title', opt: true);
  static String? _$year(MovieDTO v) => v.year;
  static const Field<MovieDTO, String> _f$year =
      Field('year', _$year, key: r'Year', opt: true);
  static String? _$rated(MovieDTO v) => v.rated;
  static const Field<MovieDTO, String> _f$rated =
      Field('rated', _$rated, key: r'Rated', opt: true);
  static String? _$released(MovieDTO v) => v.released;
  static const Field<MovieDTO, String> _f$released =
      Field('released', _$released, key: r'Released', opt: true);
  static String? _$runtime(MovieDTO v) => v.runtime;
  static const Field<MovieDTO, String> _f$runtime =
      Field('runtime', _$runtime, key: r'Runtime', opt: true);
  static String? _$genre(MovieDTO v) => v.genre;
  static const Field<MovieDTO, String> _f$genre =
      Field('genre', _$genre, key: r'Genre', opt: true);
  static String? _$director(MovieDTO v) => v.director;
  static const Field<MovieDTO, String> _f$director =
      Field('director', _$director, key: r'Director', opt: true);
  static String? _$writer(MovieDTO v) => v.writer;
  static const Field<MovieDTO, String> _f$writer =
      Field('writer', _$writer, key: r'Writer', opt: true);
  static String? _$actors(MovieDTO v) => v.actors;
  static const Field<MovieDTO, String> _f$actors =
      Field('actors', _$actors, key: r'Actors', opt: true);
  static String? _$plot(MovieDTO v) => v.plot;
  static const Field<MovieDTO, String> _f$plot =
      Field('plot', _$plot, key: r'Plot', opt: true);
  static String? _$language(MovieDTO v) => v.language;
  static const Field<MovieDTO, String> _f$language =
      Field('language', _$language, key: r'Language', opt: true);
  static String? _$country(MovieDTO v) => v.country;
  static const Field<MovieDTO, String> _f$country =
      Field('country', _$country, key: r'Country', opt: true);
  static String? _$awards(MovieDTO v) => v.awards;
  static const Field<MovieDTO, String> _f$awards =
      Field('awards', _$awards, key: r'Awards', opt: true);
  static String? _$posterUrl(MovieDTO v) => v.posterUrl;
  static const Field<MovieDTO, String> _f$posterUrl =
      Field('posterUrl', _$posterUrl, key: r'Poster', opt: true);
  static String? _$metascore(MovieDTO v) => v.metascore;
  static const Field<MovieDTO, String> _f$metascore =
      Field('metascore', _$metascore, key: r'Metascore', opt: true);
  static String? _$imdbRating(MovieDTO v) => v.imdbRating;
  static const Field<MovieDTO, String> _f$imdbRating =
      Field('imdbRating', _$imdbRating, opt: true);
  static String? _$imdbVotes(MovieDTO v) => v.imdbVotes;
  static const Field<MovieDTO, String> _f$imdbVotes =
      Field('imdbVotes', _$imdbVotes, opt: true);
  static String? _$imdbID(MovieDTO v) => v.imdbID;
  static const Field<MovieDTO, String> _f$imdbID =
      Field('imdbID', _$imdbID, opt: true);
  static String? _$type(MovieDTO v) => v.type;
  static const Field<MovieDTO, String> _f$type =
      Field('type', _$type, key: r'Type', opt: true);
  static String? _$response(MovieDTO v) => v.response;
  static const Field<MovieDTO, String> _f$response =
      Field('response', _$response, key: r'Response', opt: true);
  static List<String>? _$images(MovieDTO v) => v.images;
  static const Field<MovieDTO, List<String>> _f$images =
      Field('images', _$images, key: r'Images', opt: true);
  static bool? _$comingSoon(MovieDTO v) => v.comingSoon;
  static const Field<MovieDTO, bool> _f$comingSoon =
      Field('comingSoon', _$comingSoon, key: r'ComingSoon', opt: true);
  static bool? _$isFavorite(MovieDTO v) => v.isFavorite;
  static const Field<MovieDTO, bool> _f$isFavorite =
      Field('isFavorite', _$isFavorite, opt: true);

  @override
  final MappableFields<MovieDTO> fields = const {
    #id: _f$id,
    #title: _f$title,
    #year: _f$year,
    #rated: _f$rated,
    #released: _f$released,
    #runtime: _f$runtime,
    #genre: _f$genre,
    #director: _f$director,
    #writer: _f$writer,
    #actors: _f$actors,
    #plot: _f$plot,
    #language: _f$language,
    #country: _f$country,
    #awards: _f$awards,
    #posterUrl: _f$posterUrl,
    #metascore: _f$metascore,
    #imdbRating: _f$imdbRating,
    #imdbVotes: _f$imdbVotes,
    #imdbID: _f$imdbID,
    #type: _f$type,
    #response: _f$response,
    #images: _f$images,
    #comingSoon: _f$comingSoon,
    #isFavorite: _f$isFavorite,
  };

  static MovieDTO _instantiate(DecodingData data) {
    return MovieDTO(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        year: data.dec(_f$year),
        rated: data.dec(_f$rated),
        released: data.dec(_f$released),
        runtime: data.dec(_f$runtime),
        genre: data.dec(_f$genre),
        director: data.dec(_f$director),
        writer: data.dec(_f$writer),
        actors: data.dec(_f$actors),
        plot: data.dec(_f$plot),
        language: data.dec(_f$language),
        country: data.dec(_f$country),
        awards: data.dec(_f$awards),
        posterUrl: data.dec(_f$posterUrl),
        metascore: data.dec(_f$metascore),
        imdbRating: data.dec(_f$imdbRating),
        imdbVotes: data.dec(_f$imdbVotes),
        imdbID: data.dec(_f$imdbID),
        type: data.dec(_f$type),
        response: data.dec(_f$response),
        images: data.dec(_f$images),
        comingSoon: data.dec(_f$comingSoon),
        isFavorite: data.dec(_f$isFavorite));
  }

  @override
  final Function instantiate = _instantiate;

  static MovieDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MovieDTO>(map);
  }

  static MovieDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<MovieDTO>(json);
  }
}

mixin MovieDTOMappable {
  String toJsonString() {
    return MovieDTOMapper.ensureInitialized()
        .encodeJson<MovieDTO>(this as MovieDTO);
  }

  Map<String, dynamic> toJson() {
    return MovieDTOMapper.ensureInitialized()
        .encodeMap<MovieDTO>(this as MovieDTO);
  }

  MovieDTOCopyWith<MovieDTO, MovieDTO, MovieDTO> get copyWith =>
      _MovieDTOCopyWithImpl(this as MovieDTO, $identity, $identity);
  @override
  String toString() {
    return MovieDTOMapper.ensureInitialized().stringifyValue(this as MovieDTO);
  }

  @override
  bool operator ==(Object other) {
    return MovieDTOMapper.ensureInitialized()
        .equalsValue(this as MovieDTO, other);
  }

  @override
  int get hashCode {
    return MovieDTOMapper.ensureInitialized().hashValue(this as MovieDTO);
  }
}

extension MovieDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, MovieDTO, $Out> {
  MovieDTOCopyWith<$R, MovieDTO, $Out> get $asMovieDTO =>
      $base.as((v, t, t2) => _MovieDTOCopyWithImpl(v, t, t2));
}

abstract class MovieDTOCopyWith<$R, $In extends MovieDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get images;
  $R call(
      {String? id,
      String? title,
      String? year,
      String? rated,
      String? released,
      String? runtime,
      String? genre,
      String? director,
      String? writer,
      String? actors,
      String? plot,
      String? language,
      String? country,
      String? awards,
      String? posterUrl,
      String? metascore,
      String? imdbRating,
      String? imdbVotes,
      String? imdbID,
      String? type,
      String? response,
      List<String>? images,
      bool? comingSoon,
      bool? isFavorite});
  MovieDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MovieDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MovieDTO, $Out>
    implements MovieDTOCopyWith<$R, MovieDTO, $Out> {
  _MovieDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MovieDTO> $mapper =
      MovieDTOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get images =>
      $value.images != null
          ? ListCopyWith($value.images!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(images: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? title = $none,
          Object? year = $none,
          Object? rated = $none,
          Object? released = $none,
          Object? runtime = $none,
          Object? genre = $none,
          Object? director = $none,
          Object? writer = $none,
          Object? actors = $none,
          Object? plot = $none,
          Object? language = $none,
          Object? country = $none,
          Object? awards = $none,
          Object? posterUrl = $none,
          Object? metascore = $none,
          Object? imdbRating = $none,
          Object? imdbVotes = $none,
          Object? imdbID = $none,
          Object? type = $none,
          Object? response = $none,
          Object? images = $none,
          Object? comingSoon = $none,
          Object? isFavorite = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != $none) #title: title,
        if (year != $none) #year: year,
        if (rated != $none) #rated: rated,
        if (released != $none) #released: released,
        if (runtime != $none) #runtime: runtime,
        if (genre != $none) #genre: genre,
        if (director != $none) #director: director,
        if (writer != $none) #writer: writer,
        if (actors != $none) #actors: actors,
        if (plot != $none) #plot: plot,
        if (language != $none) #language: language,
        if (country != $none) #country: country,
        if (awards != $none) #awards: awards,
        if (posterUrl != $none) #posterUrl: posterUrl,
        if (metascore != $none) #metascore: metascore,
        if (imdbRating != $none) #imdbRating: imdbRating,
        if (imdbVotes != $none) #imdbVotes: imdbVotes,
        if (imdbID != $none) #imdbID: imdbID,
        if (type != $none) #type: type,
        if (response != $none) #response: response,
        if (images != $none) #images: images,
        if (comingSoon != $none) #comingSoon: comingSoon,
        if (isFavorite != $none) #isFavorite: isFavorite
      }));
  @override
  MovieDTO $make(CopyWithData data) => MovieDTO(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      year: data.get(#year, or: $value.year),
      rated: data.get(#rated, or: $value.rated),
      released: data.get(#released, or: $value.released),
      runtime: data.get(#runtime, or: $value.runtime),
      genre: data.get(#genre, or: $value.genre),
      director: data.get(#director, or: $value.director),
      writer: data.get(#writer, or: $value.writer),
      actors: data.get(#actors, or: $value.actors),
      plot: data.get(#plot, or: $value.plot),
      language: data.get(#language, or: $value.language),
      country: data.get(#country, or: $value.country),
      awards: data.get(#awards, or: $value.awards),
      posterUrl: data.get(#posterUrl, or: $value.posterUrl),
      metascore: data.get(#metascore, or: $value.metascore),
      imdbRating: data.get(#imdbRating, or: $value.imdbRating),
      imdbVotes: data.get(#imdbVotes, or: $value.imdbVotes),
      imdbID: data.get(#imdbID, or: $value.imdbID),
      type: data.get(#type, or: $value.type),
      response: data.get(#response, or: $value.response),
      images: data.get(#images, or: $value.images),
      comingSoon: data.get(#comingSoon, or: $value.comingSoon),
      isFavorite: data.get(#isFavorite, or: $value.isFavorite));

  @override
  MovieDTOCopyWith<$R2, MovieDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MovieDTOCopyWithImpl($value, $cast, t);
}
