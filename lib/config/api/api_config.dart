import 'package:flutter/foundation.dart';

@immutable
final class ApiConfig {
  static final Uri _devBaseUrl = Uri.https('caseapi.servicelabs.tech');

  static String get baseUrl {
    return _devBaseUrl.toString();
  }

  static String get baseAuthority {
    return _devBaseUrl.host;
  }
}
