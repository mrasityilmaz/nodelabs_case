import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';

/// [RawResponseDTO] is a model class that is used to
/// general model or primitive type.
final class RawResponseDTO extends INetworkModel<RawResponseDTO> with EquatableMixin {
  /// [RawResponseDTO] constructor is used to create a new [RawResponseDTO]
  const RawResponseDTO({this.data});

  /// [data] is a getter method that returns the data of the model.
  final Map<String, dynamic>? data;

  @override
  Map<String, Object>? toJson() => null;

  @override
  RawResponseDTO fromJson(Map<String, dynamic>? json) {
    return RawResponseDTO(data: json);
  }

  @override
  List<Object?> get props => [data];
}
