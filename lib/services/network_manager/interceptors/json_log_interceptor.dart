import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

// TODO : Refactor it
/// Logs network requests, responses, and errors as single-line JSON objects.
class JsonLogInterceptor extends Interceptor {
  JsonLogInterceptor({
    this.logRequest = true,
    this.logRequestHeader = true,
    this.logRequestBody = true,
    this.logResponseHeader = true,
    this.logResponseBody = true,
    this.logError = true,
    this.logPrint = print,
  });

  /// Whether to log request information.
  final bool logRequest;

  /// Whether to log request headers.
  final bool logRequestHeader;

  /// Whether to log request body.

  final bool logRequestBody;

  /// Whether to log response headers.
  final bool logResponseHeader;

  /// Whether to log response body.
  final bool logResponseBody;

  /// Whether to log error information.
  final bool logError;

  /// The function used to print logs. Defaults to `print`.
  /// You can provide a custom printer, e.g., `debugPrint` in Flutter or a file logger.
  final void Function(Object object) logPrint;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (!logRequest) {
      super.onRequest(options, handler);
      return;
    }

    final logData = <String, dynamic>{
      '_type': 'Request',
      'uri': options.uri.toString(),
      'method': options.method,
      'responseType': options.responseType.toString(),
      'followRedirects': options.followRedirects,
      'persistentConnection': options.persistentConnection,
      'connectTimeoutMs': options.connectTimeout?.inMilliseconds,
      'sendTimeoutMs': options.sendTimeout?.inMilliseconds,
      'receiveTimeoutMs': options.receiveTimeout?.inMilliseconds,
      'receiveDataWhenStatusError': options.receiveDataWhenStatusError,
    };

    if (options.extra.isNotEmpty) {
      logData['extra'] = options.extra;
    }

    if (logRequestHeader) {
      final headers = options.headers;
      logData['headers'] = headers.containsKey(HttpHeaders.authorizationHeader)
          ? headers[HttpHeaders.authorizationHeader].toString().substring(5)
          : 'No Authorization Header';
    }

    if (logRequestBody && options.contentType.toString().contains('application/json')) {
      logData['data'] = options.data;
    }

    _logJson(logData);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final logData = <String, dynamic>{
      '_type': 'Response',
      'uri': response.requestOptions.uri.toString(),
      'method': response.requestOptions.method,
    };

    if (logResponseHeader) {
      logData['statusCode'] = response.statusCode;

      if (response.isRedirect == true) {
        logData['redirect'] = response.realUri.toString();
      }
    }

    // if (logResponseBody &&
    //     response.headers.value('content-type').toString().contains('application/json') &&
    //     (int.tryParse(response.headers.value('content-length') ?? '0') ?? 1000) < 1000) {
    //   logData['data'] = response.data;
    // }

    _logJson(logData);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!logError) {
      handler.next(err);
      return;
    }

    final logData = <String, dynamic>{
      '_type': 'Error',
      'uri': err.requestOptions.uri.toString(),
      'method': err.requestOptions.method,
      'error': {
        'type': err.type.toString(),
        'message': err.message,
        // 'stackTrace': err.stackTrace?.toString(), // Can be very verbose
      },
    };

    if (err.response != null) {
      final errorResponse = err.response!;
      logData['response'] = {
        'statusCode': errorResponse.statusCode,
      };
      // if (logResponseHeader) {
      //   logData['response']['headers'] = errorResponse.headers.map;
      // }
      // if (logResponseBody) {
      //   logData['response']['data'] = errorResponse.data;
      // }
    }

    _logJson(logData);
    super.onError(err, handler);
  }

  final JsonEncoder _jsonEncoder = const JsonEncoder.withIndent('\t');

  void _logJson(Map<String, dynamic> data) {
    try {
      final jsonString = _jsonEncoder.convert(data);
      logPrint(jsonString);
    } catch (e, s) {
      logPrint('Error encoding log data to JSON: $e');
      logPrint('Stacktrace: $s');
      // Fallback to printing the raw map if JSON encoding fails for some reason
      logPrint('Fallback raw log data: $data');
    }
  }
}
