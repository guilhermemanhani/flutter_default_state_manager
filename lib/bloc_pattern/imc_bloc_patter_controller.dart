import 'dart:async';
import 'dart:math';

import 'package:flutter_default_state_manager/bloc_pattern/imc_state.dart';

class ImcBlocPatterController {
  final _icmStreamController = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0));

  Stream<ImcState> get imcOut => _icmStreamController.stream;
  // outra forma de fazer
  // Sink<ImcState> get imcIn => _icmStreamController.sink;

  Future<void> calcularImc({
    required double peso,
    required double altura,
  }) async {
    try {
      // _icmStreamController.add(ImcState(imc: 0));
      _icmStreamController.add(ImcStateLoading());
      // imcIn.add(ImcState(imc: 0));
      await Future.delayed(const Duration(seconds: 1));
      final imc = peso / pow(altura, 2);
      throw Exception();
      // imcIn.add(ImcState(imc: imc));
      _icmStreamController.add(ImcState(imc: imc));
    } on Exception catch (e) {
      _icmStreamController.add(ImcStateError(messagem: 'Erro'));
    }
  }

  void dispose() {
    _icmStreamController.close();
  }
}
