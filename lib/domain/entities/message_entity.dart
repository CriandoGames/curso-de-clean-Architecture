// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:curso_clear_arch/domain/error/domain_erros.dart';

import 'entity.dart';

class MessageEntity extends Entity {
  final String id;
  final String msg;

  MessageEntity({required this.id, required this.msg}) {
    validation();
  }

  @override
  bool validation() {
    if (id.isEmpty) {
      throw ErrorIdEmpty();
    }
    if (msg.isEmpty) {
      throw ErrorMessageEmpty();
    }
    return true;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'msg': msg,
    };
  }

  factory MessageEntity.fromMap(Map<String, dynamic> map) {
    try {
      return MessageEntity(
        id: map['slip']['id'].toString(),
        msg: map['slip']['advice'] as String,
      );
    } catch (e) {
      throw ErrorConvertingMapInObject();
    }
  }

  String toJson() => json.encode(toMap());

  factory MessageEntity.fromJson(String source) =>
      MessageEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MessageEntity(id: $id, msg: $msg)';
}
