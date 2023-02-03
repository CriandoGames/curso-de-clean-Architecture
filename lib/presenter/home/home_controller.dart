import 'package:curso_clear_arch/presenter/home/store/phase_state.dart';
import 'package:flutter/material.dart';

import '../../domain/contract/repositories/repository_message_day.dart';

class HomeController extends ValueNotifier<PhaseState> {
  final RepositoryMessageDay _repositoryMessageDay;

  HomeController({
    required RepositoryMessageDay repositoryMessageDay,
  })  : _repositoryMessageDay = repositoryMessageDay,
        super(PhaseInitial());

  Future<void> getAdvice() async {
    try {
      value = PhaseLoading();
      final message = await _repositoryMessageDay();
      value = PhaseSuccess(message: message);
    } catch (e) {
      value = PhaseFailure(error: e.toString());
    }
  }

  void reset() {
    value = PhaseInitial();
  }


}
