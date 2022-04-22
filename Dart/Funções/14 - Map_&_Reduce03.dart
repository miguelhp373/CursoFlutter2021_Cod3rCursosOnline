main() {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 9.3},
    {'nome': 'Ana', 'nota': 6.8},
    {'nome': 'Ricardo', 'nota': 8.1},
    {'nome': 'Mariana', 'nota': 7.6},
  ];

  var notasFinais = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => (nota as double).roundToDouble())
      .where((nota) => nota >= 8);

  var total = notasFinais.reduce((t, a) => t + a);

  print("O valor da média é: ${total / notasFinais.length}");
}


//para rodar este codigo, pode ser utilizado o vscode com a
// extensao code runner, ou o dartpad.com