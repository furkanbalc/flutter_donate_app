class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, "");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Geçersiz İstek: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Yetkisiz: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([ message]) : super(message, "Geçersiz Giriş: ");
}

class TimeOutException extends AppException {
  TimeOutException([ message]) : super(message, "Timeout: ");
}
