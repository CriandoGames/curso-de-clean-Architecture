import 'package:auto_injector/auto_injector.dart';
import 'package:curso_clear_arch/data/datasource_adviceslip_impl.dart';
import 'package:curso_clear_arch/domain/contract/repositories/repository_message_day.dart';
import 'package:curso_clear_arch/infra/contracts/gateways/http_service_impl.dart';
import 'package:curso_clear_arch/infra/contracts/repositories/repository_message_day_impl.dart';
import 'package:curso_clear_arch/infra/data/datasource_adviceslip.dart';
import 'package:curso_clear_arch/presenter/home/home_controller.dart';
import 'package:uno/uno.dart';

import '../../domain/contract/gateways/http_service.dart';

final autoInjector = AutoInjector();

abstract class AutoContainer {
  static void setup() {
    /// Register a instance.
    /// A concrete object (Not a function)
    autoInjector.addInstance<Uno>(Uno());

    autoInjector.addLazySingleton<HttpService>(HttpServiceUno.new);

    autoInjector.addSingleton<DatasourceAdviceslip>(DatasourceAdviceslipImpl.new);

    autoInjector.add<RepositoryMessageDay>(RepositoryMessageDayImpl.new);

    autoInjector.add<HomeController>(HomeController.new);
  }
}
