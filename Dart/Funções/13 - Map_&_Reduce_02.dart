main() {
  var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
  var total = notas.reduce(somar);

  print(total);

  //reduce pode transformar uma lista em qualquer coisa, por
  //exemplo: lista em objeto,lista em numero, lista em outra lista etc.
}

double somar(double acumulador, double elemento) {
  print("$acumulador $elemento");
  return acumulador + elemento;
}
