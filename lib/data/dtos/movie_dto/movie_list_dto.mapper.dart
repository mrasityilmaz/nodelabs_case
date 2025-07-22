// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'movie_list_dto.dart';

class MovieListDTOMapper extends ClassMapperBase<MovieListDTO> {
  MovieListDTOMapper._();

  static MovieListDTOMapper? _instance;
  static MovieListDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MovieListDTOMapper._());
      MovieDTOMapper.ensureInitialized();
      PaginationDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MovieListDTO';

  static List<MovieDTO> _$movies(MovieListDTO v) => v.movies;
  static const Field<MovieListDTO, List<MovieDTO>> _f$movies =
      Field('movies', _$movies, opt: true, def: const []);
  static PaginationDTO? _$pagination(MovieListDTO v) => v.pagination;
  static const Field<MovieListDTO, PaginationDTO> _f$pagination =
      Field('pagination', _$pagination, opt: true);

  @override
  final MappableFields<MovieListDTO> fields = const {
    #movies: _f$movies,
    #pagination: _f$pagination,
  };

  static MovieListDTO _instantiate(DecodingData data) {
    return MovieListDTO(
        movies: data.dec(_f$movies), pagination: data.dec(_f$pagination));
  }

  @override
  final Function instantiate = _instantiate;

  static MovieListDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MovieListDTO>(map);
  }

  static MovieListDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<MovieListDTO>(json);
  }
}

mixin MovieListDTOMappable {
  String toJsonString() {
    return MovieListDTOMapper.ensureInitialized()
        .encodeJson<MovieListDTO>(this as MovieListDTO);
  }

  Map<String, dynamic> toJson() {
    return MovieListDTOMapper.ensureInitialized()
        .encodeMap<MovieListDTO>(this as MovieListDTO);
  }

  MovieListDTOCopyWith<MovieListDTO, MovieListDTO, MovieListDTO> get copyWith =>
      _MovieListDTOCopyWithImpl(this as MovieListDTO, $identity, $identity);
  @override
  String toString() {
    return MovieListDTOMapper.ensureInitialized()
        .stringifyValue(this as MovieListDTO);
  }

  @override
  bool operator ==(Object other) {
    return MovieListDTOMapper.ensureInitialized()
        .equalsValue(this as MovieListDTO, other);
  }

  @override
  int get hashCode {
    return MovieListDTOMapper.ensureInitialized()
        .hashValue(this as MovieListDTO);
  }
}

extension MovieListDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MovieListDTO, $Out> {
  MovieListDTOCopyWith<$R, MovieListDTO, $Out> get $asMovieListDTO =>
      $base.as((v, t, t2) => _MovieListDTOCopyWithImpl(v, t, t2));
}

abstract class MovieListDTOCopyWith<$R, $In extends MovieListDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, MovieDTO, MovieDTOCopyWith<$R, MovieDTO, MovieDTO>>
      get movies;
  PaginationDTOCopyWith<$R, PaginationDTO, PaginationDTO>? get pagination;
  $R call({List<MovieDTO>? movies, PaginationDTO? pagination});
  MovieListDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MovieListDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MovieListDTO, $Out>
    implements MovieListDTOCopyWith<$R, MovieListDTO, $Out> {
  _MovieListDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MovieListDTO> $mapper =
      MovieListDTOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, MovieDTO, MovieDTOCopyWith<$R, MovieDTO, MovieDTO>>
      get movies => ListCopyWith($value.movies, (v, t) => v.copyWith.$chain(t),
          (v) => call(movies: v));
  @override
  PaginationDTOCopyWith<$R, PaginationDTO, PaginationDTO>? get pagination =>
      $value.pagination?.copyWith.$chain((v) => call(pagination: v));
  @override
  $R call({List<MovieDTO>? movies, Object? pagination = $none}) =>
      $apply(FieldCopyWithData({
        if (movies != null) #movies: movies,
        if (pagination != $none) #pagination: pagination
      }));
  @override
  MovieListDTO $make(CopyWithData data) => MovieListDTO(
      movies: data.get(#movies, or: $value.movies),
      pagination: data.get(#pagination, or: $value.pagination));

  @override
  MovieListDTOCopyWith<$R2, MovieListDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MovieListDTOCopyWithImpl($value, $cast, t);
}
