import 'dart:io';
import 'package:dio/dio.dart';
import 'package:musicidia/core/network/api_exception.dart';
import 'package:rxdart/rxdart.dart';

/// Base class for all the data source which will call
/// external APIs for the data.
class BaseApi {
  /// Wrapper for API calls for handling errors at common place
  /// instead of parsing it in calling Widgets.
  Stream<Response<T>> callApi<T>(Future<Response<T>> future) {
    print("CALLEING CALL API");
    return Stream.fromFuture(future).map((response) {
      print("================================response $response");
      final error = _getErrorObject(response);
      if (error != null) throw error;

      return response;
    }).onErrorResume((error, stackTrace) {
      print("================================error $error");

      // If error is DioError i.e http exception, we
      // should parse the exact message instead of
      // returning the HTTP Status code and standard message.
      if (error is DioException) {
        // Check if error is of time out error
        if (error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          return Stream.error(ServerConnectionException(
              'Couldn\'t connect with server. Please try again.'));
        }

        // Check if the error is regarding no internet connection.
        if (error.type == DioExceptionType.unknown &&
            error.error is SocketException) {
          return Stream.error(NoInternetException());
        }

        // Check if server responded with non-success status code.
        // In this case, we will check if we got a specific error
        // from API to display to the user.
        if (error.response is Response<dynamic>) {
          final appException = _getErrorObject(error.response!);
          if (appException != null) {
            return Stream.error(appException);
          }
        }
      }

      // We are here that means the error wasn't http exception.
      // This could be any un-handled exception from server.
      // In this case, instead of showing weird errors to users
      // like bad response or internal server error, show him
      // a generic message.
      return Stream.error((error is AppException)
          ? error
          : AppException('Something went wrong, Please try again'));
    });
  }

  /// Parses the response to get the error object if any
  /// from the API response based on status code.
  AppException? _getErrorObject(Response response) {
    if (response.statusCode == 502) {
      return AppException(
          'We are experiencing technical issues, Please try again!');
    } else if (response.statusCode == 401) {
    } else {
      final responseData = response.data;
      if (responseData != null && responseData is Map) {
        if (responseData.containsKey('status')) {
          final status = responseData['status'];
          if (status == 0) {
            return AppException(responseData['message']['error'] ??
                'Something went wrong, Please try again');
          }
        }
      }
    }

    return null;
  }
}
