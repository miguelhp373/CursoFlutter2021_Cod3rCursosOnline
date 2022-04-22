//PARAMETROS NOMEADOS

main() {
  imprimirData(ano: 2021);
  saudarPessoa(nome: 'João', idade: 22);
}

saudarPessoa({String? nome, int? idade}) {
  print("Olá $nome nem parece que voce tem a $idade anos.");
}

imprimirData({int dia = 1, int ano = 1980, int mes = 1}) {
  print("$dia/$mes/$ano");
}



//-----------------------------------------------------
//1/1/2021
//Olá João nem parece que voce tem a 22 anos.