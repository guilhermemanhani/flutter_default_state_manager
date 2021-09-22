class ImcState {
  final double imc;
  ImcState({
    required this.imc,
  });
}

class ImcStateLoading extends ImcState {
  ImcStateLoading() : super(imc: 0.0);
}

class ImcStateError extends ImcState {
  String messagem;
  ImcStateError({
    required this.messagem,
  }) : super(imc: 0.0);
}
