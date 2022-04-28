class Carro {
  final int velocidadeMaxima;
  int? velocidadeAtual;
  Carro([
    this.velocidadeMaxima = 200,
    this.velocidadeAtual = 0,
  ]);

  int acelerarCarro() {
    return velocidadeAtual! + 5 > velocidadeMaxima
        ? velocidadeAtual = velocidadeMaxima
        : velocidadeAtual = velocidadeAtual! + 5;
  }

  int frearCarro() {
    return velocidadeAtual! - 5 < 0
        ? velocidadeAtual = 0
        : velocidadeAtual = velocidadeAtual! - 5;
  }

  bool estaNoLimite() {
    return velocidadeMaxima == velocidadeAtual ? true : false;
  }
}
