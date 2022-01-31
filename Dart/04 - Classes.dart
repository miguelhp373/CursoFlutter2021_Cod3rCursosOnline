class Produto {
  String? nome;
  double? preco;

  Produto({this.nome, this.preco});

  // Produto(String nome, double preco){
  //     this.nome = nome;
  //     this.preco = preco;
  // }
}

main() {
  var p1 = Produto(nome: 'Caneta', preco: 4.99);

  print('O produto ${p1.nome} tem preço R\$${p1.preco}');
}
