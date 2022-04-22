//FUNÇÃO COMO PARAMETRO

import 'dart:math';

void executar(Function fnPar, Function fnImpar) {
  var randomNumber = Random().nextInt(10);
  print('o Valor Sorteado foi $randomNumber');
  randomNumber % 2 == 0 ? fnPar() : fnImpar;
}

main() {
  var myFnPar = () => print('Eita! O Valor é Par!');
  var myFnImpar = () => print('Legal! O Valor é Impar!');

  executar(myFnPar, myFnImpar);
}
