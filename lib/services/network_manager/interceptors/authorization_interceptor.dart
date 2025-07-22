import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_request_model.dart';
import 'package:nodelabs_movie_case/services/token_service.dart';

@immutable
final class AuthorizationInterceptor extends Interceptor {
  final TokenService _tokenService;

  const AuthorizationInterceptor(this._tokenService);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // check if header has authorization key
    final bool requiresAuth = options.headers.containsKey(BaseRequestModel.authorizationInterceptorKey);

    // If the header has authorization key,
    // get the token from the token service
    // and add it to the header
    if (requiresAuth) {
      final tokenService = _tokenService;
      final authHeaders = tokenService.bearerHeader;
      options.headers.remove(BaseRequestModel.authorizationInterceptorKey);
      options.headers.addAll(authHeaders);
    }
    super.onRequest(options, handler);
  }
}
