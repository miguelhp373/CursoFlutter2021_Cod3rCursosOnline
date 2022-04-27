// todo construtor começa com o nome da classe

class Data {
  //attributes
  int? dia;
  int? mes;
  int? ano;

  //alterar os valores
  //utilizando [] torna os parametros opcionais
  Data([this.dia = 1, this.mes = 1, this.ano = 1970]);

  //construtor nomeado
  Data.com({
    this.dia = 1,
    this.mes = 1,
    this.ano = 1970,
  });

  Data.ultimoDiaDoAno(this.ano) {
    dia = 31;
    mes = 12;
  }

  //metodo para formatar a data e retornar
  //retorna uma string
  String formataData() {
    return "${dia}/${mes}/${ano}";
  }

  //qualquer string que esta classe retornar ira ser pelo metodo formata data
  String toString() {
    return formataData();
  }
}

main() {
  var dataAniversario = new Data(3, 10, 2022);
  var dataCompra = Data(11, 12, 2021);

  print("A data do anivesário é: ${dataAniversario.toString()}");
  print("A data da compra é: ${dataCompra.toString()}");
  //parametros opcionais e nao obrigatorios
  print(Data(31));
  print(Data(31, 12));
  print(Data(31, 12, 2022));

  print(Data.com(ano: 2022));

  var dataFinal = Data.com(dia: 12, mes: 7, ano: 2023);
  print(dataFinal);

  print(Data.ultimoDiaDoAno(2023));
}
