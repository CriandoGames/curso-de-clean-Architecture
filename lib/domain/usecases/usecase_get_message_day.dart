import 'package:curso_clear_arch/domain/error/erros.dart';
import 'package:either_dart/either.dart';

import '../entities/message_entity.dart';

abstract class UseCaseGetMessageDay {
  Future<Either<Errors,MessageEntity>> call();
}
