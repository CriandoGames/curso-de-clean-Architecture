// Criado por: Carlos Castro
//Essa classe representa os estados da fase da requisição
// inicial , sucesso , falha, carregando

import '../../../domain/entities/message_entity.dart';

abstract class PhaseState {}

class PhaseInitial extends PhaseState {}

class PhaseLoading extends PhaseState {}

class PhaseSuccess extends PhaseState {
  final MessageEntity message;

  PhaseSuccess({required this.message});
}

class PhaseFailure extends PhaseState {
  final String error;

  PhaseFailure({required this.error});
}
