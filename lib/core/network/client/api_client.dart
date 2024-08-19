import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:musicidia/core/constants/network.dart';

class ApiClient {
  static final ApiClient _converter = ApiClient._internal();

  static const String requiresHeader = 'header';
  static const String authHeader = 'basic_auth';
  static const String authorization = 'Authorization';
  late Dio dioClient;

  factory ApiClient() {
    return _converter;
  }

  ApiClient._internal();

  Dio dio() {
    dioClient = Dio(
      BaseOptions(
        baseUrl: RestNetworkConstants.apiHost,
      ),
    );

    // Removed in Production
    dioClient.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        var httpClient = HttpClient()
          ..badCertificateCallback = (cert, String host, int port) => true;
        return httpClient;
      },
    );

    if (kDebugMode) {
      dioClient.interceptors.add(LogInterceptor(
        error: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ));
    }
    updateDioInterceptor();
    return dioClient;
  }

  Future<void> updateDioInterceptor() async {
    if (kDebugMode) {
      print(
          "================================dioClient.interceptors================================");
    }
    dioClient.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      return handler.next(options);
    }, onResponse: (Response response, handler) async {
      return handler.next(response);
    }, onError: (DioException error, handler) async {
      return handler.next(error);
    }));
  }
}
