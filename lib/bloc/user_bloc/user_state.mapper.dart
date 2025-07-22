// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_state.dart';

class UserStateMapper extends ClassMapperBase<UserState> {
  UserStateMapper._();

  static UserStateMapper? _instance;
  static UserStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserState';

  static UserModel? _$user(UserState v) => v.user;
  static const Field<UserState, UserModel> _f$user =
      Field('user', _$user, opt: true);
  static bool _$isLoading(UserState v) => v.isLoading;
  static const Field<UserState, bool> _f$isLoading = Field(
      'isLoading', _$isLoading,
      key: r'is_loading', opt: true, def: false);
  static String? _$error(UserState v) => v.error;
  static const Field<UserState, String> _f$error =
      Field('error', _$error, opt: true);
  static String? _$selectedImagePath(UserState v) => v.selectedImagePath;
  static const Field<UserState, String> _f$selectedImagePath = Field(
      'selectedImagePath', _$selectedImagePath,
      key: r'selected_image_path', opt: true);

  @override
  final MappableFields<UserState> fields = const {
    #user: _f$user,
    #isLoading: _f$isLoading,
    #error: _f$error,
    #selectedImagePath: _f$selectedImagePath,
  };

  static UserState _instantiate(DecodingData data) {
    return UserState(
        user: data.dec(_f$user),
        isLoading: data.dec(_f$isLoading),
        error: data.dec(_f$error),
        selectedImagePath: data.dec(_f$selectedImagePath));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin UserStateMappable {
  String toJsonString() {
    return UserStateMapper.ensureInitialized()
        .encodeJson<UserState>(this as UserState);
  }

  Map<String, dynamic> toJson() {
    return UserStateMapper.ensureInitialized()
        .encodeMap<UserState>(this as UserState);
  }

  UserStateCopyWith<UserState, UserState, UserState> get copyWith =>
      _UserStateCopyWithImpl(this as UserState, $identity, $identity);
}

extension UserStateValueCopy<$R, $Out> on ObjectCopyWith<$R, UserState, $Out> {
  UserStateCopyWith<$R, UserState, $Out> get $asUserState =>
      $base.as((v, t, t2) => _UserStateCopyWithImpl(v, t, t2));
}

abstract class UserStateCopyWith<$R, $In extends UserState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {UserModel? user,
      bool? isLoading,
      String? error,
      String? selectedImagePath});
  UserStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserState, $Out>
    implements UserStateCopyWith<$R, UserState, $Out> {
  _UserStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserState> $mapper =
      UserStateMapper.ensureInitialized();
  @override
  $R call(
          {Object? user = $none,
          bool? isLoading,
          Object? error = $none,
          Object? selectedImagePath = $none}) =>
      $apply(FieldCopyWithData({
        if (user != $none) #user: user,
        if (isLoading != null) #isLoading: isLoading,
        if (error != $none) #error: error,
        if (selectedImagePath != $none) #selectedImagePath: selectedImagePath
      }));
  @override
  UserState $make(CopyWithData data) => UserState(
      user: data.get(#user, or: $value.user),
      isLoading: data.get(#isLoading, or: $value.isLoading),
      error: data.get(#error, or: $value.error),
      selectedImagePath:
          data.get(#selectedImagePath, or: $value.selectedImagePath));

  @override
  UserStateCopyWith<$R2, UserState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserStateCopyWithImpl($value, $cast, t);
}
