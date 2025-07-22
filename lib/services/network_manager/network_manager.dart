import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/config/api/api_config.dart';
import 'package:nodelabs_movie_case/data/dtos/base_response_dto/base_response_dto.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_request_model.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_response_model.dart';
import 'package:nodelabs_movie_case/services/network_manager/interceptors/authorization_interceptor.dart';
import 'package:nodelabs_movie_case/services/token_service.dart';
import 'package:vexana/vexana.dart';

class NetworkService extends NetworkManager<BaseResponseModel<BaseResponseDTO>> {
  factory NetworkService.create(TokenService tokenService) => NetworkService._(tokenService);
  NetworkService._(TokenService tokenService)
      : super(
          options: BaseOptions(baseUrl: ApiConfig.baseUrl),
          isEnableLogger: false,
          errorModel: const BaseResponseModel<BaseResponseDTO>(),
          interceptor: AuthorizationInterceptor(tokenService),
        );

  /// API isteklerini gönderir ve BaseResponseModel formatında yanıt bekler.
  ///
  /// TDataModel: API yanıtının "data" alanı içindeki asıl veri modelinin tipi (örn: ApiHealthDTO).
  ///
  /// ```dart
  /// // Kullanım Örneği:
  ///
  ///// Varsayılan DTO'ların ve Request Modellerinin tanımlı olduğunu varsayalım.
  ///
  ///Future<void> checkApiHealth() async {
  ///  final networkService = NetworkService();
  ///  final healthRequest = GetHealthRequest(parseModel: const ApiHealthDTO()); // parseModel önemli!
  ///
  ///  final response = await networkService.sendWithCustomResponse<ApiHealthDTO>(healthRequest);
  ///
  ///  if (response.data != null && response.data?.ok == true) {
  ///    ApiHealthDTO? healthData = response.data!.data;
  ///    print('API Health Status: ${healthData?.status}');
  ///  } else if (response.data?.error != null && response.data?.ok == false) {
  ///    // API'nin kendi döndüğü hata (ok: false)
  ///    BaseErrorDetailModel? apiError = response.data!.error;
  ///    print('API Error: ${apiError.message?.join(', ')}');
  ///  } else if (response.error != null) {
  ///    // Vexana seviyesi hata (Network hatası, 4xx, 5xx vb.)
  ///    BaseErrorDetailModel? networkError = response.error;
  ///    print('Network/Vexana Error: ${networkError.message?.join(', ')}');
  ///    print('Status Code: ${networkError.statusCode}');
  ///  } else {
  ///    print('Unknown error');
  ///  }
  ///}
  ///
  ///```
  Future<IResponseModel<BaseResponseModel<TDataModel>?, BaseResponseModel<BaseResponseDTO>?>>
      sendWithCustomResponse<TDataModel extends INetworkModel<TDataModel>>(
    BaseRequestModel<TDataModel> request, // request.parseModel TDataModel tipinde olmalı
  ) async {
    // Vexana'nın send<T_Vexana, R_Vexana> metodu:
    // T_Vexana: Vexana'nın parseModel argümanının tipi. Bu, R_Vexana'nın fromJson'ına yardımcı olmak için kullanılır
    //           veya R_Vexana T_Vexana ya da List<T_Vexana> ise doğrudan kullanılır.
    //           Bizim durumumuzda, BaseResponseModel<TDataModel> parse işlemini kendi içinde yapacağı için
    //           T_Vexana olarak BaseResponseModel<TDataModel>'ı ve parseModel olarak da
    //           BaseResponseModel(data: request.parseModel) örneğini kullanacağız.
    // R_Vexana: Vexana'nın başarılı yanıtı (tüm JSON) parse edeceği tip.
    //           Bu da BaseResponseModel<TDataModel> olacak.

    return send<BaseResponseModel<TDataModel>, BaseResponseModel<TDataModel>>(
      request.path,
      parseModel: BaseResponseModel<TDataModel>(data: request.parseModel),
      method: request.requestMethod,
      queryParameters: request.queryParameters,
      options: Options(headers: request.headers),
      data: request.body,
    );
  }

  NetworkManager<BaseResponseModel<BaseResponseDTO>> createNewInstance({required String baseUrl}) {
    return NetworkManager<BaseResponseModel<BaseResponseDTO>>(
      options: BaseOptions(baseUrl: baseUrl),
      isEnableLogger: kDebugMode,
    );
  }
}
