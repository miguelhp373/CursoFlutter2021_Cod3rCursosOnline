//Criando objetos a partir de classes.
//instanciando classes
//metodos
class Data {
  int? dia;
  int? mes;
  int? ano;

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
  var dataAniversario = new Data();

  dataAniversario.dia = 3;
  dataAniversario.mes = 10;
  dataAniversario.ano = 2020;

  Data dataCompra = Data();

  dataCompra.dia = 11;
  dataCompra.mes = 12;
  dataCompra.ano = 2021;

  print('');
  print('-------------------------');
  print('Metodo Normal com Return');
  print("A data do anivesário é: ${dataAniversario.formataData()}");
  print("A data da compra é: ${dataCompra.formataData()}");
  print('');
  print('-------------------------');
  print('Metodo retornando outro metodo');
  print(dataCompra.toString());
  print(dataAniversario.toString());
}
