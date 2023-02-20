import 'package:curso_clear_arch/domain/contract/gateways/http_service.dart';
import 'package:curso_clear_arch/domain/error/erros.dart';
import 'package:either_dart/either.dart';

abstract class DatasourceAdviceslip {
  Future<Either<Errors, CustomHttpResponse>> getAdvice();
}
