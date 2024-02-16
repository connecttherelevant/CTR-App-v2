class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "${_prefix ?? ""}${_message ?? ""}";
  }
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

class NoInternetException extends AppException {
  NoInternetException([message])
      : super(message, "No internet connection found!");
}

class ServerConnectionException extends AppException {
  ServerConnectionException([message]) : super(message, '');
}
