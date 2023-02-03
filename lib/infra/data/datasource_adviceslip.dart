import 'package:curso_clear_arch/domain/contract/gateways/http_service.dart';

abstract class DatasourceAdviceslip {
  Future<CustomHttpResponse> getAdvice();
}



