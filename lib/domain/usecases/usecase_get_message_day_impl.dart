import 'package:curso_clear_arch/domain/error/domain_erros.dart';

import '../contract/repositories/repository_message_day.dart';
import '../entities/message_entity.dart';
import 'usecase_get_message_day.dart';

class UseCaseGetMessageDayImpl implements UseCaseGetMessageDay {
  final RepositoryMessageDay _repository;

  UseCaseGetMessageDayImpl({required RepositoryMessageDay repository})
      : _repository = repository;

  @override
  Future<MessageEntity> call() async {
    try {
      return await _repository();
    } on ErrorIdEmpty {
      rethrow;
    } on ErrorMessageEmpty {
      rethrow;
    } on ErrorConvertingMapInObject {
      rethrow;
    } catch (e) {
      throw Exception(e);
    }
  }
}
