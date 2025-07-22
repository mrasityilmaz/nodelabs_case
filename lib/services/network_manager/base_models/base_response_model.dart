import 'package:nodelabs_movie_case/data/dtos/base_response_dto/base_response_dto.dart';
import 'package:vexana/vexana.dart';

class BaseResponseModel<T extends INetworkModel<T>> extends INetworkModel<BaseResponseModel<T>> {
  const BaseResponseModel({
    this.data,
    this.response = const BaseResponseDTO(),
  });
  final T? data;
  final BaseResponseDTO response;

  @override
  BaseResponseModel<T> fromJson(Map<String, dynamic> json) {
    final jsonData = json['data'];
    final jsonResponse = json['response'];
    T? parsedData;
    BaseResponseDTO parsedResponse = const BaseResponseDTO();

    if (this.data != null && jsonData != null) {
      if (jsonData is List) {
        parsedData = this.data!.fromJson(json);
      } else {
        parsedData = this.data!.fromJson(jsonData as Map<String, dynamic>);
      }
    } else if (jsonData == null && T.toString() == 'EmptyModel') {
      // parsedData = const EmptyModel() as T; // Eğer EmptyModel özel bir durumsa
    }

    if (jsonResponse != null) {
      parsedResponse = BaseResponseDTO.fromJsonStatic(jsonResponse as Map<String, dynamic>);
    }

    return BaseResponseModel(
      data: parsedData,
      response: parsedResponse,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'response': response.toJson(),
    };
  }
}
