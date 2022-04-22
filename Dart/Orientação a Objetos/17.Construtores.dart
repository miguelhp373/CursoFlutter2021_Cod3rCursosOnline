//Com os construtores a partir de uma classe é possivel
//criar uma instancia

class Data {
  int? dia;
  int? mes;
  int? ano;

  //alterar os valores
  //utilizando [] torna os parametros opcionais
  Data([this.dia = 1, this.mes = 1, this.ano = 1970]);

  //metodo para formatar a data e retornar
  //retorna uma string
  String formataData() {
    return "${dia}/${mes}/${ano}";
  }

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
}
