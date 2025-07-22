import 'package:nodelabs_movie_case/config/api/api_paths.dart';
import 'package:vexana/vexana.dart';

abstract class BaseRequestModel<T extends INetworkModel<T>> {
  const BaseRequestModel({
    required this.apiPath,
    required this.path,
    required this.parseModel,
    required this.requestMethod,
    this.queryParameters,
    this.headers,
    this.body,
    this.baseUrl,
  });

  /// Just for aliasing.
  final ApiPaths apiPath;
  final String path;
  final T parseModel;
  final RequestType requestMethod;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final dynamic body;
  final String? baseUrl;

  /// If the request is authorized, put that in your request model.
  ///
  /// This header is detected by the interceptor.
  ///
  /// The Interceptor will add the bearer token to the request.
  static const Map<String, dynamic> getBearerDefaultHeader = {authorizationInterceptorKey: ''};

  static const authorizationInterceptorKey = 'authorizationInterceptorKey';

  /// If the request is authorized, return true.
  ///
  /// The Interceptor will add the bearer token to the request.
  bool get isAuthorized => headers?[authorizationInterceptorKey] != null;
}
