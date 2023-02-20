import 'package:curso_clear_arch/domain/error/domain_erros.dart';
import 'package:curso_clear_arch/domain/error/erros.dart';
import 'package:either_dart/either.dart';

import '../contract/repositories/repository_message_day.dart';
import '../entities/message_entity.dart';
import 'usecase_get_message_day.dart';

class UseCaseGetMessageDayImpl implements UseCaseGetMessageDay {
  final RepositoryMessageDay _repository;

  UseCaseGetMessageDayImpl({required RepositoryMessageDay repository})
      : _repository = repository;

  @override
  Future<Either<Errors,MessageEntity>> call() async {
    final result = _repository();

    return result;
  }
}
