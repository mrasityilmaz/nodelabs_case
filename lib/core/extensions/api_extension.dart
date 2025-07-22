import 'dart:async';

import 'package:nodelabs_movie_case/core/errors/errors.dart';
import 'package:nodelabs_movie_case/data/dtos/base_response_dto/base_response_dto.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_response_model.dart';
import 'package:vexana/vexana.dart';

extension ApiExtension<T extends INetworkModel<T>>
    on IResponseModel<BaseResponseModel<T>?, BaseResponseModel<BaseResponseDTO>?> {
  FutureOr<R> fold<R>({
    required R Function(T responseData) ifSuccess,
    required R Function(BaseResponseDTO error) ifError,
  }) {
    try {
      if (error != null) {
        return ifError(
          error!.model?.response ?? const BaseResponseDTO(),
        );
      }

      final responseModel = data;
      if (responseModel == null) {
        return ifError(
          const BaseResponseDTO(
            statusCode: -1,
            message: 'EMPTY_RESPONSE',
          ),
        );
      }

      final responseInfo = responseModel.response;
      final responseData = responseModel.data;

      if (responseInfo.statusCode >= 200 && responseInfo.statusCode < 300) {
        if (responseData != null) {
          return ifSuccess(responseData);
        } else {
          return ifError(
            BaseResponseDTO(
              statusCode: responseInfo.statusCode,
              message: 'EMPTY_RESPONSE_DATA',
            ),
          );
        }
      } else {
        return ifError(
          BaseResponseDTO(
            statusCode: responseInfo.statusCode,
            message: responseInfo.message ?? 'UNKNOWN_SERVER_ERROR',
          ),
        );
      }
    } catch (e) {
      return ifError(
        BaseResponseDTO(
          statusCode: -99,
          message: 'İstek işlenirken beklenmedik bir hata oluştu: $e',
        ),
      );
    }
  }
}

extension BaseApiExceptionExtension on BaseResponseDTO {
  BaseApiException toBaseApiException([StackTrace? stackTrace]) {
    return BaseApiException(
      error: this,
      statusCode: statusCode,
      errorMessage: message,
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }
}
