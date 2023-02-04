// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  @override
  String toString() => 'MessageEntity(id: $id, msg: $msg)';
}
