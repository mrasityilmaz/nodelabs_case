import 'package:dart_mappable/dart_mappable.dart';
import 'package:vexana/vexana.dart';

part 'base_response_dto.mapper.dart';

@MappableClass()
final class BaseResponseDTO extends INetworkModel<BaseResponseDTO> with BaseResponseDTOMappable {
  const BaseResponseDTO({this.statusCode = 400, this.message = 'Unknown Error'});

  @MappableField(key: 'code')
  final int statusCode;
  final String? message;

  static const fromJsonString = BaseResponseDTOMapper.fromJsonString;
  static const fromJsonStatic = BaseResponseDTOMapper.fromJson;

  @override
  BaseResponseDTO fromJson(Map<String, dynamic> json) {
    return BaseResponseDTOMapper.fromJson(json);
  }
}
