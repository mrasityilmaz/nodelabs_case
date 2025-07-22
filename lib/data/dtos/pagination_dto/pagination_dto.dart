import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vexana/vexana.dart';

part 'pagination_dto.mapper.dart';

@immutable
@MappableClass(caseStyle: CaseStyle.camelCase)
final class PaginationDTO extends INetworkModel<PaginationDTO> with PaginationDTOMappable {
  const PaginationDTO({
    this.totalCount,
    this.perPage,
    this.maxPage,
    this.currentPage,
  });

  final int? totalCount;
  final int? perPage;
  final int? maxPage;
  final int? currentPage;

  static const fromJsonString = PaginationDTOMapper.fromJsonString;
  static const fromJsonStatic = PaginationDTOMapper.fromJson;

  @override
  PaginationDTO fromJson(Map<String, dynamic> json) {
    return PaginationDTOMapper.fromJson(json);
  }
}
