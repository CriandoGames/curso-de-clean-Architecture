import 'package:curso_clear_arch/data/datasource_adviceslip_impl.dart';
import 'package:curso_clear_arch/domain/contract/gateways/http_service.dart';
import 'package:curso_clear_arch/domain/contract/repositories/repository_message_day.dart';
import 'package:curso_clear_arch/domain/error/domain_erros.dart';
import 'package:curso_clear_arch/domain/usecases/usecase_get_message_day.dart';
import 'package:curso_clear_arch/domain/usecases/usecase_get_message_day_impl.dart';
import 'package:curso_clear_arch/infra/contracts/gateways/http_service_impl.dart';
import 'package:curso_clear_arch/infra/contracts/repositories/repository_message_day_impl.dart';
import 'package:curso_clear_arch/infra/data/datasource_adviceslip.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uno/uno.dart';

main() {
  late UseCaseGetMessageDay useCase;
  late RepositoryMessageDay repository;
  late DatasourceAdviceslip datasource;
  late HttpService client;

  setUp(() {
    client = HttpServiceUno(client: Uno());
    datasource = DatasourceAdviceslipImpl(client);
    repository = RepositoryMessageDayImpl(datasource: datasource);
    useCase = UseCaseGetMessageDayImpl(repository: repository);
  });

  test('should be return message of service', () async {
    try {
      final result = await useCase();
      expect(result.right, isNotEmpty);
    } on ErrorIdEmpty {
      throwsA(isA<ErrorIdEmpty>());
    } on ErrorMessageEmpty {
      throwsA(isA<ErrorMessageEmpty>());
    } on ErrorConvertingMapInObject {
      throwsA(isA<ErrorConvertingMapInObject>());
    } catch (e) {
      throwsA(isA<ServerError>());
    }
  });
}
