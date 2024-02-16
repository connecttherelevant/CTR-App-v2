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

  ApiClient._internal() {
    print("================ApiClient._internal========================");
    dioClient = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        baseUrl: RestNetworkConstants.apiHost,
      ),
    );

    // Removed in Production
    // Disable SSL verification (not recommended in production)
    (dioClient.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, host, port) => true;
      return client;
    };

    dioClient.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        var httpClient = HttpClient()
          ..badCertificateCallback = (cert, String host, int port) => true;
        return httpClient;
      },
    );

    // for production add certificate
    // (dioClient.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) {
    //     return host == RestConstants.API_HOST;
    //   };
    //   return client;
    // };

    if (kDebugMode) {
      // dioClient.interceptors.add(LogInterceptor(
      //   error: true,
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      // ));
    }
    updateDioInterceptor();
  }

  Dio dio() {
    return dioClient;
  }

  Future<void> updateDioInterceptor() async {
    dioClient.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      print("Request====");
      return handler.next(options);
    }, onResponse: (Response response, handler) async {
      print("Response======");
      return handler.next(response);
    }, onError: (DioException error, handler) async {
      print("= Error====== ${error.error}");
      print("${error.response}");
      print("===${error.type}======");
      return handler.next(error);
    }));
  }
}
