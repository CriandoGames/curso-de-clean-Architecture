import 'package:curso_clear_arch/domain/entities/message_entity.dart';

abstract class RepositoryMessageDay {
  Future<MessageEntity> call();
}
