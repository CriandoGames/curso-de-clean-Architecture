import 'package:curso_clear_arch/domain/entities/message_entity.dart';
import 'package:curso_clear_arch/domain/error/erros.dart';
import 'package:curso_clear_arch/infra/data/datasource_adviceslip.dart';
import 'package:either_dart/either.dart';

import '../../../domain/contract/repositories/repository_message_day.dart';
import '../../../domain/error/domain_erros.dart';
import '../../data/dto/message_dto.dart';

class RepositoryMessageDayImpl implements RepositoryMessageDay {
  final DatasourceAdviceslip _datasource;

  RepositoryMessageDayImpl({required DatasourceAdviceslip datasource})
      : _datasource = datasource;

  @override
  Future<Either<Errors, MessageEntity>> call() async {
    final response = await _datasource.getAdvice();

    if (response.isRight) {
      if (response.right.statusCode == 200) {
        try {
          return Right(MessageDTO.fromMap(response.right.data).toEntity());
        } on Exception {
          return Left(ErrorConvertingMapInObject());
        }
      }
    }

    return Left(ServerError());
  }
}
