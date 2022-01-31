//FUNÇÃO EM VARIAVEL

main() {
  int a = 2;

  //tipo nome = valor;

  int Function(int, int) soma1 = somaFn;
  print(soma1(20, 313));

  //FUNÇÃO EM VARIAVEL, FUNÇÃO ANONIMA
  int Function(int, int) soma2 = (x, y) {
    return x + y;
  };
  print(soma2(20, 313));
}

int somaFn(int a, int b) {
  return a + b;
}


//----------------------------------
//333
//333