//create DTO of entity MessageEntity

import 'package:curso_clear_arch/domain/entities/message_entity.dart';

class MessageDTO {
  final String message;
  final String id;

  MessageDTO({
    required this.message,
    required this.id,
  });

  factory MessageDTO.fromMap(Map<String, dynamic> map) {
    return MessageDTO(
      message: map['slip']['advice'] as String,
      id: map['slip']['id'].toString(),
    );
  }

  MessageEntity toEntity() {
    return MessageEntity(
      msg: message,
      id: id,
    );
  }
}
