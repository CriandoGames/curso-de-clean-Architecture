import 'package:curso_clear_arch/domain/entities/message_entity.dart';
import 'package:curso_clear_arch/infra/data/datasource_adviceslip.dart';

import '../../../domain/contract/repositories/repository_message_day.dart';
import '../../../domain/error/domain_erros.dart';

class RepositoryMessageDayImpl implements RepositoryMessageDay {
  final DatasourceAdviceslip _datasource;

  RepositoryMessageDayImpl({required DatasourceAdviceslip datasource})
      : _datasource = datasource;

  @override
  Future<MessageEntity> call() async {
    
      final response = await _datasource.getAdvice();

      if (response.statusCode == 200) {
        return MessageEntity.fromMap(response.data);
      } else {
        throw ServerError();
     
   
  }
  }
}
