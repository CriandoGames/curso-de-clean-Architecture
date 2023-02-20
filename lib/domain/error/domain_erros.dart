import 'erros.dart';

class ErrorMessageEmpty implements Errors {
  final String message;

  ErrorMessageEmpty({this.message = 'Message is empty'});

  @override
  String toString() => message;
}

class ErrorIdEmpty implements Errors {
  final String message;

  ErrorIdEmpty({this.message = 'id is empty'});

  @override
  String toString() => message;
}

class ErrorConvertingMapInObject implements Errors {
  final String message;

  ErrorConvertingMapInObject({this.message = 'Error converting map in object'});

  @override
  String toString() => message;
}

class ServerError implements Errors {
  final String message;

  ServerError({this.message = 'Server Error - 500'});
  @override
  String toString() => message;
}

class RepositoryError implements Errors {
  final String message;

  RepositoryError({this.message = 'Repository is not converted to entity'});

  @override
  String toString() => message;
}
