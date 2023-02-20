import 'package:curso_clear_arch/domain/contract/gateways/http_service.dart';
import 'package:curso_clear_arch/domain/error/domain_erros.dart';
import 'package:curso_clear_arch/domain/error/erros.dart';
import 'package:either_dart/either.dart';

import '../infra/data/datasource_adviceslip.dart';

class DatasourceAdviceslipImpl implements DatasourceAdviceslip {
  final HttpService _httpService;

  DatasourceAdviceslipImpl(this._httpService);
  @override
  Future<Either<Errors, CustomHttpResponse>> getAdvice() async {
    try {
      final result =
          await _httpService.get('https://api.adviceslip.com/advice');
      return Right(result);
    } on Exception {
      return Left(ServerError());
    }
  }
}
