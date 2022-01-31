

//Função Basica
somarComPrint(int a, int b) {
  return a + b;
}

void main() {
  final result = somarComPrint(2, 2);

  print(result);
}





//Parametros Opcionais

import 'dart:math';

main() {
  int n1 = numeroAleatorio(100);
  print(n1);

  int n2 = numeroAleatorio();
  print(n2);
}

int numeroAleatorio([int maxValue = 10]) {
  return Random().nextInt(maxValue);
}





//função de imprimir data, parametro opcional
main() {
  imprimirData();
}

imprimirData([int dia = 1, int mes = 1, int ano = 1970]) {
  print('$dia/$mes/$ano');
}
