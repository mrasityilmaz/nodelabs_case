import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:vexana/vexana.dart';

@immutable
final class DebouncerInterceptor extends Interceptor {
  DebouncerInterceptor({Duration? debounceTime}) : _debounceTime = debounceTime ?? const Duration(milliseconds: 300);
  final Duration _debounceTime;
  final Map<String, Timer> _timers = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String key = _getRequestKey(options);

    if (_timers.containsKey(key)) {
      _timers[key]?.cancel();
    }

    final timer = Timer(_debounceTime, () {
      _timers.remove(key);
      handler.next(options);
    });

    _timers[key] = timer;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final String key = _getRequestKey(err.requestOptions);
    _timers.remove(key);
    handler.next(err);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final String key = _getRequestKey(response.requestOptions);
    _timers.remove(key);
    handler.next(response);
  }

  String _getRequestKey(RequestOptions options) {
    return '${options.method}_${options.uri}_${options.data?.toString() ?? ''}';
  }

  void dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
  }
}
