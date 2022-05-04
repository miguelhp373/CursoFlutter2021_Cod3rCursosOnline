class Carro {
  final int velocidadeMaxima;
  int _velocidadeAtual;
  Carro([
    this.velocidadeMaxima = 200,
    this._velocidadeAtual = 0,
  ]);

//metodo get para exportar atributos privados
  int get velocidadeAtual {
    return this._velocidadeAtual;
  }

//recebe para alteração, com uma validação
  void set velocidadeAtual(int novaVelocidade) {
    bool deltaValido = (_velocidadeAtual - velocidadeAtual).abs() <= 5;
    if (deltaValido && novaVelocidade >= 0) {
      this._velocidadeAtual = novaVelocidade;
    }
  }

  int acelerarCarro() {
    return _velocidadeAtual + 5 > velocidadeMaxima
        ? _velocidadeAtual = velocidadeMaxima
        : _velocidadeAtual = _velocidadeAtual + 5;
  }

  int frearCarro() {
    return _velocidadeAtual - 5 < 0
        ? _velocidadeAtual = 0
        : _velocidadeAtual = _velocidadeAtual - 5;
  }

  bool estaNoLimite() {
    return velocidadeMaxima == _velocidadeAtual ? true : false;
  }
}
