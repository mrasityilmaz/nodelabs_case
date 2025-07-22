import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';

class TokenService with ClassLoggerMixin {
  factory TokenService.create(FlutterSecureStorage secureStorage) => TokenService._(secureStorage);
  TokenService._(this._secureStorage) {
    instanceInitialized();
  }

  final FlutterSecureStorage _secureStorage;

  final String _accessTokenKey = 'movie_case_app_access_token_key';

  //
  // MARK: Access Token
  //

  String? _accessToken;
  String? get accessToken => _accessToken;
  bool get hasAccessToken => _accessToken != null && _accessToken?.isNotEmpty == true;
  @protected
  void _setAccessToken(String? value) {
    _accessToken = value;
  }

  //
  // MARK: - Write Access Token
  //
  Future<void> writeAccessToken(String accessToken) async {
    try {
      await _secureStorage.write(
        key: _accessTokenKey,
        value: accessToken,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      _setAccessToken(accessToken);
      logInfo('Access token written successfully');
    } catch (e, s) {
      logError(
        'Error writing access token',
        error: e,
        stackTrace: s,
      );
    }
  }

  //
  // MARK: - Read Access Token
  //

  Future<String?> readAccessToken() async {
    try {
      final accessToken = await _secureStorage.read(
        key: _accessTokenKey,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      if (accessToken != null && accessToken.isNotEmpty) {
        logInfo('Access token read successfully');
      } else {
        logInfo('No access token found');
      }

      return accessToken;
    } catch (e, s) {
      logError(
        'Error reading access token',
        error: e,
        stackTrace: s,
      );
      return null;
    }
  }

  //
  // MARK: - Delete Access Token
  //

  Future<void> deleteAccessToken() async {
    try {
      await _secureStorage.delete(
        key: _accessTokenKey,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      _setAccessToken(null);
      logInfo('Access token deleted successfully');
    } catch (e, s) {
      logError(
        'Error deleting access token',
        error: e,
        stackTrace: s,
      );
    }
  }

  //
  // MARK: - Sync Tokens From Local Storage
  //

  Future<void> syncTokensFromLocalStorage() async {
    try {
      final accessToken = await readAccessToken();
      _setAccessToken(accessToken);
    } catch (e, s) {
      logError(
        'Error syncing tokens from local storage',
        error: e,
        stackTrace: s,
      );
    }
  }

  Map<String, String> get bearerHeader {
    return {
      if (hasAccessToken) ...{
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      },
    };
  }

  //
  // MARK: - secure storage options
  //

  IOSOptions _getIOSOptions() => const IOSOptions(
        accountName: 'movie_case_app',
      );

  AndroidOptions _getAndroidOptions() => AndroidOptions();
}
