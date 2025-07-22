// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_dto.dart';

class UserDTOMapper extends ClassMapperBase<UserDTO> {
  UserDTOMapper._();

  static UserDTOMapper? _instance;
  static UserDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserDTO';

  static String? _$id(UserDTO v) => v.id;
  static const Field<UserDTO, String> _f$id = Field('id', _$id, opt: true);
  static String? _$name(UserDTO v) => v.name;
  static const Field<UserDTO, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$email(UserDTO v) => v.email;
  static const Field<UserDTO, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$photoUrl(UserDTO v) => v.photoUrl;
  static const Field<UserDTO, String> _f$photoUrl =
      Field('photoUrl', _$photoUrl, opt: true);
  static String? _$token(UserDTO v) => v.token;
  static const Field<UserDTO, String> _f$token =
      Field('token', _$token, opt: true);

  @override
  final MappableFields<UserDTO> fields = const {
    #id: _f$id,
    #name: _f$name,
    #email: _f$email,
    #photoUrl: _f$photoUrl,
    #token: _f$token,
  };

  static UserDTO _instantiate(DecodingData data) {
    return UserDTO(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        photoUrl: data.dec(_f$photoUrl),
        token: data.dec(_f$token));
  }

  @override
  final Function instantiate = _instantiate;

  static UserDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDTO>(map);
  }

  static UserDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserDTO>(json);
  }
}

mixin UserDTOMappable {
  String toJsonString() {
    return UserDTOMapper.ensureInitialized()
        .encodeJson<UserDTO>(this as UserDTO);
  }

  Map<String, dynamic> toJson() {
    return UserDTOMapper.ensureInitialized()
        .encodeMap<UserDTO>(this as UserDTO);
  }

  UserDTOCopyWith<UserDTO, UserDTO, UserDTO> get copyWith =>
      _UserDTOCopyWithImpl(this as UserDTO, $identity, $identity);
  @override
  String toString() {
    return UserDTOMapper.ensureInitialized().stringifyValue(this as UserDTO);
  }

  @override
  bool operator ==(Object other) {
    return UserDTOMapper.ensureInitialized()
        .equalsValue(this as UserDTO, other);
  }

  @override
  int get hashCode {
    return UserDTOMapper.ensureInitialized().hashValue(this as UserDTO);
  }
}

extension UserDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, UserDTO, $Out> {
  UserDTOCopyWith<$R, UserDTO, $Out> get $asUserDTO =>
      $base.as((v, t, t2) => _UserDTOCopyWithImpl(v, t, t2));
}

abstract class UserDTOCopyWith<$R, $In extends UserDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? name,
      String? email,
      String? photoUrl,
      String? token});
  UserDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDTO, $Out>
    implements UserDTOCopyWith<$R, UserDTO, $Out> {
  _UserDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDTO> $mapper =
      UserDTOMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? email = $none,
          Object? photoUrl = $none,
          Object? token = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (email != $none) #email: email,
        if (photoUrl != $none) #photoUrl: photoUrl,
        if (token != $none) #token: token
      }));
  @override
  UserDTO $make(CopyWithData data) => UserDTO(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      photoUrl: data.get(#photoUrl, or: $value.photoUrl),
      token: data.get(#token, or: $value.token));

  @override
  UserDTOCopyWith<$R2, UserDTO, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserDTOCopyWithImpl($value, $cast, t);
}
