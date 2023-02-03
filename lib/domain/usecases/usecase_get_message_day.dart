import '../entities/message_entity.dart';

abstract class UseCaseGetMessageDay {
  Future<MessageEntity> call();
}
