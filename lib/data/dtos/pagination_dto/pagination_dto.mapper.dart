// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pagination_dto.dart';

class PaginationDTOMapper extends ClassMapperBase<PaginationDTO> {
  PaginationDTOMapper._();

  static PaginationDTOMapper? _instance;
  static PaginationDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaginationDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PaginationDTO';

  static int? _$totalCount(PaginationDTO v) => v.totalCount;
  static const Field<PaginationDTO, int> _f$totalCount =
      Field('totalCount', _$totalCount, opt: true);
  static int? _$perPage(PaginationDTO v) => v.perPage;
  static const Field<PaginationDTO, int> _f$perPage =
      Field('perPage', _$perPage, opt: true);
  static int? _$maxPage(PaginationDTO v) => v.maxPage;
  static const Field<PaginationDTO, int> _f$maxPage =
      Field('maxPage', _$maxPage, opt: true);
  static int? _$currentPage(PaginationDTO v) => v.currentPage;
  static const Field<PaginationDTO, int> _f$currentPage =
      Field('currentPage', _$currentPage, opt: true);

  @override
  final MappableFields<PaginationDTO> fields = const {
    #totalCount: _f$totalCount,
    #perPage: _f$perPage,
    #maxPage: _f$maxPage,
    #currentPage: _f$currentPage,
  };

  static PaginationDTO _instantiate(DecodingData data) {
    return PaginationDTO(
        totalCount: data.dec(_f$totalCount),
        perPage: data.dec(_f$perPage),
        maxPage: data.dec(_f$maxPage),
        currentPage: data.dec(_f$currentPage));
  }

  @override
  final Function instantiate = _instantiate;

  static PaginationDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaginationDTO>(map);
  }

  static PaginationDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<PaginationDTO>(json);
  }
}

mixin PaginationDTOMappable {
  String toJsonString() {
    return PaginationDTOMapper.ensureInitialized()
        .encodeJson<PaginationDTO>(this as PaginationDTO);
  }

  Map<String, dynamic> toJson() {
    return PaginationDTOMapper.ensureInitialized()
        .encodeMap<PaginationDTO>(this as PaginationDTO);
  }

  PaginationDTOCopyWith<PaginationDTO, PaginationDTO, PaginationDTO>
      get copyWith => _PaginationDTOCopyWithImpl(
          this as PaginationDTO, $identity, $identity);
  @override
  String toString() {
    return PaginationDTOMapper.ensureInitialized()
        .stringifyValue(this as PaginationDTO);
  }

  @override
  bool operator ==(Object other) {
    return PaginationDTOMapper.ensureInitialized()
        .equalsValue(this as PaginationDTO, other);
  }

  @override
  int get hashCode {
    return PaginationDTOMapper.ensureInitialized()
        .hashValue(this as PaginationDTO);
  }
}

extension PaginationDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaginationDTO, $Out> {
  PaginationDTOCopyWith<$R, PaginationDTO, $Out> get $asPaginationDTO =>
      $base.as((v, t, t2) => _PaginationDTOCopyWithImpl(v, t, t2));
}

abstract class PaginationDTOCopyWith<$R, $In extends PaginationDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? totalCount, int? perPage, int? maxPage, int? currentPage});
  PaginationDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PaginationDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaginationDTO, $Out>
    implements PaginationDTOCopyWith<$R, PaginationDTO, $Out> {
  _PaginationDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaginationDTO> $mapper =
      PaginationDTOMapper.ensureInitialized();
  @override
  $R call(
          {Object? totalCount = $none,
          Object? perPage = $none,
          Object? maxPage = $none,
          Object? currentPage = $none}) =>
      $apply(FieldCopyWithData({
        if (totalCount != $none) #totalCount: totalCount,
        if (perPage != $none) #perPage: perPage,
        if (maxPage != $none) #maxPage: maxPage,
        if (currentPage != $none) #currentPage: currentPage
      }));
  @override
  PaginationDTO $make(CopyWithData data) => PaginationDTO(
      totalCount: data.get(#totalCount, or: $value.totalCount),
      perPage: data.get(#perPage, or: $value.perPage),
      maxPage: data.get(#maxPage, or: $value.maxPage),
      currentPage: data.get(#currentPage, or: $value.currentPage));

  @override
  PaginationDTOCopyWith<$R2, PaginationDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaginationDTOCopyWithImpl($value, $cast, t);
}
