class NetworkException implements Exception {
  final _message;
  final _prefix;
  final body;

  NetworkException([this._message, this._prefix, this.body]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([message, body]) : super(message, "", body);
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, "");
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String? message]) : super(message, "");
}

class BadGateway extends NetworkException {
  BadGateway([String? message]) : super(message, "");
}
