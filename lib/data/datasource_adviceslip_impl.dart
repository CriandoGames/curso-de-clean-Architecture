import 'package:curso_clear_arch/domain/contract/gateways/http_service.dart';

import '../infra/data/datasource_adviceslip.dart';

class DatasourceAdviceslipImpl implements DatasourceAdviceslip {
  final HttpService _httpService;

  DatasourceAdviceslipImpl(this._httpService);
  @override
  Future<CustomHttpResponse> getAdvice() {
    return _httpService.get('https://api.adviceslip.com/advice');
  }
}
