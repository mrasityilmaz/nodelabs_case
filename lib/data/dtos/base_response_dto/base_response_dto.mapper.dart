// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'base_response_dto.dart';

class BaseResponseDTOMapper extends ClassMapperBase<BaseResponseDTO> {
  BaseResponseDTOMapper._();

  static BaseResponseDTOMapper? _instance;
  static BaseResponseDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseResponseDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BaseResponseDTO';

  static int _$statusCode(BaseResponseDTO v) => v.statusCode;
  static const Field<BaseResponseDTO, int> _f$statusCode =
      Field('statusCode', _$statusCode, key: r'code', opt: true, def: 400);
  static String? _$message(BaseResponseDTO v) => v.message;
  static const Field<BaseResponseDTO, String> _f$message =
      Field('message', _$message, opt: true, def: 'Unknown Error');

  @override
  final MappableFields<BaseResponseDTO> fields = const {
    #statusCode: _f$statusCode,
    #message: _f$message,
  };

  static BaseResponseDTO _instantiate(DecodingData data) {
    return BaseResponseDTO(
        statusCode: data.dec(_f$statusCode), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static BaseResponseDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BaseResponseDTO>(map);
  }

  static BaseResponseDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<BaseResponseDTO>(json);
  }
}

mixin BaseResponseDTOMappable {
  String toJsonString() {
    return BaseResponseDTOMapper.ensureInitialized()
        .encodeJson<BaseResponseDTO>(this as BaseResponseDTO);
  }

  Map<String, dynamic> toJson() {
    return BaseResponseDTOMapper.ensureInitialized()
        .encodeMap<BaseResponseDTO>(this as BaseResponseDTO);
  }

  BaseResponseDTOCopyWith<BaseResponseDTO, BaseResponseDTO, BaseResponseDTO>
      get copyWith => _BaseResponseDTOCopyWithImpl(
          this as BaseResponseDTO, $identity, $identity);
  @override
  String toString() {
    return BaseResponseDTOMapper.ensureInitialized()
        .stringifyValue(this as BaseResponseDTO);
  }

  @override
  bool operator ==(Object other) {
    return BaseResponseDTOMapper.ensureInitialized()
        .equalsValue(this as BaseResponseDTO, other);
  }

  @override
  int get hashCode {
    return BaseResponseDTOMapper.ensureInitialized()
        .hashValue(this as BaseResponseDTO);
  }
}

extension BaseResponseDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BaseResponseDTO, $Out> {
  BaseResponseDTOCopyWith<$R, BaseResponseDTO, $Out> get $asBaseResponseDTO =>
      $base.as((v, t, t2) => _BaseResponseDTOCopyWithImpl(v, t, t2));
}

abstract class BaseResponseDTOCopyWith<$R, $In extends BaseResponseDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? statusCode, String? message});
  BaseResponseDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BaseResponseDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BaseResponseDTO, $Out>
    implements BaseResponseDTOCopyWith<$R, BaseResponseDTO, $Out> {
  _BaseResponseDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BaseResponseDTO> $mapper =
      BaseResponseDTOMapper.ensureInitialized();
  @override
  $R call({int? statusCode, Object? message = $none}) =>
      $apply(FieldCopyWithData({
        if (statusCode != null) #statusCode: statusCode,
        if (message != $none) #message: message
      }));
  @override
  BaseResponseDTO $make(CopyWithData data) => BaseResponseDTO(
      statusCode: data.get(#statusCode, or: $value.statusCode),
      message: data.get(#message, or: $value.message));

  @override
  BaseResponseDTOCopyWith<$R2, BaseResponseDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BaseResponseDTOCopyWithImpl($value, $cast, t);
}
