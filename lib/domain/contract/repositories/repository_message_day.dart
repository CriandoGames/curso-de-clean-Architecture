import 'package:curso_clear_arch/domain/entities/message_entity.dart';
import 'package:curso_clear_arch/domain/error/erros.dart';
import 'package:either_dart/either.dart';

abstract class RepositoryMessageDay {
  Future<Either<Errors,MessageEntity>>  call();
}
