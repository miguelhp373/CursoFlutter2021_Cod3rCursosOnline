import 'dart:core';

main() {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 9.3},
    {'nome': 'Ana', 'nota': 6.8},
    {'nome': 'Ricardo', 'nota': 8.1},
    {'nome': 'Mariana', 'nota': 7.6},
  ];

  //map to string and integer

  String Function(Map) getOnlyName = (aluno) => aluno['nome'];
  int Function(String) getTextLenght = (texto) => texto.length;

  var nomes = alunos.map(getOnlyName);
  var textLength = nomes.map(getTextLenght);
  print(nomes);
  print(textLength);

  // (Alfredo, Wilson, Guilherme, Ana, Ricardo, Mariana)
  // (7, 6, 9, 3, 7, 7)

  ////////////////
}
