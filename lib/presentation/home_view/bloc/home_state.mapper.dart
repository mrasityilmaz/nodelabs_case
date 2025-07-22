// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'home_state.dart';

class HomeStateMapper extends ClassMapperBase<HomeState> {
  HomeStateMapper._();

  static HomeStateMapper? _instance;
  static HomeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HomeState';

  static MovieListModel _$movies(HomeState v) => v.movies;
  static const Field<HomeState, MovieListModel> _f$movies =
      Field('movies', _$movies);
  static bool _$isLoading(HomeState v) => v.isLoading;
  static const Field<HomeState, bool> _f$isLoading =
      Field('isLoading', _$isLoading, key: r'is_loading');
  static bool _$isLikeBusy(HomeState v) => v.isLikeBusy;
  static const Field<HomeState, bool> _f$isLikeBusy =
      Field('isLikeBusy', _$isLikeBusy, key: r'is_like_busy');
  static bool _$isLoadingMore(HomeState v) => v.isLoadingMore;
  static const Field<HomeState, bool> _f$isLoadingMore =
      Field('isLoadingMore', _$isLoadingMore, key: r'is_loading_more');
  static MovieModel? _$currentMovie(HomeState v) => v.currentMovie;
  static const Field<HomeState, MovieModel> _f$currentMovie =
      Field('currentMovie', _$currentMovie, key: r'current_movie', opt: true);
  static String? _$error(HomeState v) => v.error;
  static const Field<HomeState, String> _f$error =
      Field('error', _$error, opt: true);

  @override
  final MappableFields<HomeState> fields = const {
    #movies: _f$movies,
    #isLoading: _f$isLoading,
    #isLikeBusy: _f$isLikeBusy,
    #isLoadingMore: _f$isLoadingMore,
    #currentMovie: _f$currentMovie,
    #error: _f$error,
  };

  static HomeState _instantiate(DecodingData data) {
    return HomeState(
        movies: data.dec(_f$movies),
        isLoading: data.dec(_f$isLoading),
        isLikeBusy: data.dec(_f$isLikeBusy),
        isLoadingMore: data.dec(_f$isLoadingMore),
        currentMovie: data.dec(_f$currentMovie),
        error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin HomeStateMappable {
  String toJsonString() {
    return HomeStateMapper.ensureInitialized()
        .encodeJson<HomeState>(this as HomeState);
  }

  Map<String, dynamic> toJson() {
    return HomeStateMapper.ensureInitialized()
        .encodeMap<HomeState>(this as HomeState);
  }

  HomeStateCopyWith<HomeState, HomeState, HomeState> get copyWith =>
      _HomeStateCopyWithImpl(this as HomeState, $identity, $identity);
  @override
  bool operator ==(Object other) {
    return HomeStateMapper.ensureInitialized()
        .equalsValue(this as HomeState, other);
  }

  @override
  int get hashCode {
    return HomeStateMapper.ensureInitialized().hashValue(this as HomeState);
  }
}

extension HomeStateValueCopy<$R, $Out> on ObjectCopyWith<$R, HomeState, $Out> {
  HomeStateCopyWith<$R, HomeState, $Out> get $asHomeState =>
      $base.as((v, t, t2) => _HomeStateCopyWithImpl(v, t, t2));
}

abstract class HomeStateCopyWith<$R, $In extends HomeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {MovieListModel? movies,
      bool? isLoading,
      bool? isLikeBusy,
      bool? isLoadingMore,
      MovieModel? currentMovie,
      String? error});
  HomeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HomeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeState, $Out>
    implements HomeStateCopyWith<$R, HomeState, $Out> {
  _HomeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeState> $mapper =
      HomeStateMapper.ensureInitialized();
  @override
  $R call(
          {MovieListModel? movies,
          bool? isLoading,
          bool? isLikeBusy,
          bool? isLoadingMore,
          Object? currentMovie = $none,
          Object? error = $none}) =>
      $apply(FieldCopyWithData({
        if (movies != null) #movies: movies,
        if (isLoading != null) #isLoading: isLoading,
        if (isLikeBusy != null) #isLikeBusy: isLikeBusy,
        if (isLoadingMore != null) #isLoadingMore: isLoadingMore,
        if (currentMovie != $none) #currentMovie: currentMovie,
        if (error != $none) #error: error
      }));
  @override
  HomeState $make(CopyWithData data) => HomeState(
      movies: data.get(#movies, or: $value.movies),
      isLoading: data.get(#isLoading, or: $value.isLoading),
      isLikeBusy: data.get(#isLikeBusy, or: $value.isLikeBusy),
      isLoadingMore: data.get(#isLoadingMore, or: $value.isLoadingMore),
      currentMovie: data.get(#currentMovie, or: $value.currentMovie),
      error: data.get(#error, or: $value.error));

  @override
  HomeStateCopyWith<$R2, HomeState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomeStateCopyWithImpl($value, $cast, t);
}
