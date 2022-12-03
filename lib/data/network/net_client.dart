import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:marvelous/data/environment.dart';

import '../DTOs/marvel_container_dto.dart';
import '../DTOs/marvel_wrapper_dto.dart';
import 'net_exception.dart';

/// Used to make network calls to the Marvel API.
class NetClient {
  static final _log = Logger('NetClient');

  final Dio _client;

  NetClient({
    String baseUrl = 'https://gateway.marvel.com',
    bool addLogger = false,
  }) : _client = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        ) {
    if (addLogger) _addLogger();
  }

  Future<MarvelWrapperDTO<MarvelContainerDTO<T>>> get<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final response = await _client.request(
        path,
        queryParameters: {
          ..._getAuthorization(),
          ...queryParameters,
        },
      );

      return MarvelWrapperDTO<MarvelContainerDTO<T>>.fromJson(
        response.data,
        (a) => MarvelContainerDTO.fromJson(
          a as Map<String, dynamic>,
          (b) => fromJson(b as Map<String, dynamic>),
        ),
      );
    } on DioError catch (e) {
      throw NetException.from(
        code: e.response?.data['code'] ?? '',
        message: e.response?.data['status'] ?? '',
      );
    }
  }

  /// Generates the authorization data as described on
  /// https://developer.marvel.com/documentation/authorization
  Map<String, dynamic> _getAuthorization() {
    final timestamp = DateTime.now().microsecondsSinceEpoch;

    final hash = md5.convert(
      utf8.encode(
        '$timestamp'
        '${Environment.marvelPrivateKey}'
        '${Environment.marvelPublicKey}',
      ),
    );

    return {
      'ts': timestamp,
      'apikey': Environment.marvelPublicKey,
      'hash': hash,
    };
  }

  /// Adds a simple log interceptor -- without any customizations for now.
  void _addLogger() {
    _client.interceptors.add(
      LogInterceptor(
        logPrint: _log.finest,
        request: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
