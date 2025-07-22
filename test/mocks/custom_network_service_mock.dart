import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/config/api/api_config.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_request_model.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_response_model.dart';
import 'package:nodelabs_movie_case/services/network_manager/interceptors/authorization_interceptor.dart';
import 'package:nodelabs_movie_case/services/token_service.dart';
import 'package:vexana/vexana.dart';

class CustomMockNetworkManager extends NetworkManager<BaseResponseModel<EmptyModel>> {
  factory CustomMockNetworkManager.create(TokenService tokenService) => CustomMockNetworkManager._(tokenService);
  CustomMockNetworkManager._(TokenService tokenService)
      : super(
            options: BaseOptions(baseUrl: ApiConfig.baseUrl),
            isEnableLogger: false,
            errorModel: const BaseResponseModel<EmptyModel>(),
            interceptor: AuthorizationInterceptor(tokenService),
            isEnableTest: true);

  Future<IResponseModel<BaseResponseModel<EmptyModel>?, BaseResponseModel<EmptyModel>?>>
      sendWithCustomResponse<TDataModel extends INetworkModel<TDataModel>>(
    BaseRequestModel<EmptyModel> request,
  ) async {
    return send<BaseResponseModel<EmptyModel>, BaseResponseModel<EmptyModel>>(
      request.path,
      parseModel: BaseResponseModel<EmptyModel>(data: request.parseModel),
      method: request.requestMethod,
      queryParameters: request.queryParameters,
      options: Options(headers: {}),
      data: request.body,
    );
  }

  NetworkManager<BaseResponseModel<EmptyModel>> createNewInstance({required String baseUrl}) {
    return NetworkManager<BaseResponseModel<EmptyModel>>(
      options: BaseOptions(baseUrl: baseUrl),
      isEnableLogger: kDebugMode,
    );
  }
}
