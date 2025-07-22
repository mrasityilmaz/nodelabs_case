// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile_state.dart';

class ProfileStateMapper extends ClassMapperBase<ProfileState> {
  ProfileStateMapper._();

  static ProfileStateMapper? _instance;
  static ProfileStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProfileState';

  static List<MovieModel> _$favoriteMovies(ProfileState v) => v.favoriteMovies;
  static const Field<ProfileState, List<MovieModel>> _f$favoriteMovies =
      Field('favoriteMovies', _$favoriteMovies, key: r'favorite_movies');
  static bool _$isLoading(ProfileState v) => v.isLoading;
  static const Field<ProfileState, bool> _f$isLoading = Field(
      'isLoading', _$isLoading,
      key: r'is_loading', opt: true, def: false);
  static String? _$error(ProfileState v) => v.error;
  static const Field<ProfileState, String> _f$error =
      Field('error', _$error, opt: true);

  @override
  final MappableFields<ProfileState> fields = const {
    #favoriteMovies: _f$favoriteMovies,
    #isLoading: _f$isLoading,
    #error: _f$error,
  };

  static ProfileState _instantiate(DecodingData data) {
    return ProfileState(
        favoriteMovies: data.dec(_f$favoriteMovies),
        isLoading: data.dec(_f$isLoading),
        error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin ProfileStateMappable {
  String toJsonString() {
    return ProfileStateMapper.ensureInitialized()
        .encodeJson<ProfileState>(this as ProfileState);
  }

  Map<String, dynamic> toJson() {
    return ProfileStateMapper.ensureInitialized()
        .encodeMap<ProfileState>(this as ProfileState);
  }

  ProfileStateCopyWith<ProfileState, ProfileState, ProfileState> get copyWith =>
      _ProfileStateCopyWithImpl(this as ProfileState, $identity, $identity);
  @override
  bool operator ==(Object other) {
    return ProfileStateMapper.ensureInitialized()
        .equalsValue(this as ProfileState, other);
  }

  @override
  int get hashCode {
    return ProfileStateMapper.ensureInitialized()
        .hashValue(this as ProfileState);
  }
}

extension ProfileStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProfileState, $Out> {
  ProfileStateCopyWith<$R, ProfileState, $Out> get $asProfileState =>
      $base.as((v, t, t2) => _ProfileStateCopyWithImpl(v, t, t2));
}

abstract class ProfileStateCopyWith<$R, $In extends ProfileState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, MovieModel, ObjectCopyWith<$R, MovieModel, MovieModel>>
      get favoriteMovies;
  $R call({List<MovieModel>? favoriteMovies, bool? isLoading, String? error});
  ProfileStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProfileStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProfileState, $Out>
    implements ProfileStateCopyWith<$R, ProfileState, $Out> {
  _ProfileStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfileState> $mapper =
      ProfileStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, MovieModel, ObjectCopyWith<$R, MovieModel, MovieModel>>
      get favoriteMovies => ListCopyWith(
          $value.favoriteMovies,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(favoriteMovies: v));
  @override
  $R call(
          {List<MovieModel>? favoriteMovies,
          bool? isLoading,
          Object? error = $none}) =>
      $apply(FieldCopyWithData({
        if (favoriteMovies != null) #favoriteMovies: favoriteMovies,
        if (isLoading != null) #isLoading: isLoading,
        if (error != $none) #error: error
      }));
  @override
  ProfileState $make(CopyWithData data) => ProfileState(
      favoriteMovies: data.get(#favoriteMovies, or: $value.favoriteMovies),
      isLoading: data.get(#isLoading, or: $value.isLoading),
      error: data.get(#error, or: $value.error));

  @override
  ProfileStateCopyWith<$R2, ProfileState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProfileStateCopyWithImpl($value, $cast, t);
}
