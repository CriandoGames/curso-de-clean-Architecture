import 'erros.dart';

class ErrorMessageEmpty implements Errors {
  final String message;

  ErrorMessageEmpty({this.message = 'Message is empty'});
}

class ErrorIdEmpty implements Errors {
  final String message;

  ErrorIdEmpty({this.message = 'id is empty'});
}

class ErrorConvertingMapInObject implements Errors {
  final String message;

  ErrorConvertingMapInObject({this.message = 'Error converting map in object'});
}

class ServerError implements Errors {
  final String message;

  ServerError({this.message = 'Server error'});
}

class RepositoryError implements Errors {
  final String message;

  RepositoryError({this.message = 'Repository is not converted to entity'});
}
