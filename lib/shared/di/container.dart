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
/// Register a instance.
abstract class AutoContainer {
  static void setup() {
    
    /// A concrete object (Not a function)
    autoInjector.addInstance<Uno>(Uno());
    
    /// A function that returns a concrete object
    autoInjector.addLazySingleton<HttpService>(HttpServiceUno.new);

    autoInjector
        .addSingleton<DatasourceAdviceslip>(DatasourceAdviceslipImpl.new);

    autoInjector.add<RepositoryMessageDay>(RepositoryMessageDayImpl.new);

    autoInjector.add<HomeController>(HomeController.new);


// podemos instanciar por modulo tambem. exemplo abaixo

    /*AutoInjector(
        tag: 'Main',
        on: (injector) {
          injector.addInstance<Uno>(Uno());

          injector.addLazySingleton<HttpService>(HttpServiceUno.new);

          injector
              .addSingleton<DatasourceAdviceslip>(DatasourceAdviceslipImpl.new);

          injector.add<RepositoryMessageDay>(RepositoryMessageDayImpl.new);

          injector.add<HomeController>(HomeController.new);
        });*/
  }
}
