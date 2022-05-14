import '../modelo/cliente.dart';
import '../modelo/venda.dart';
import '../modelo/venda_item.dart';
import '../modelo/produto.dart';

main() {
  var venda = Venda(
      cliente: Cliente(
        cpf: '999.999.999-99',
        nome: 'John Mitchel',
      ),
      itens: <VendaItem>[
        VendaItem(
          quantidade: 2,
          produto: Produto(
            codigo: 1312,
            desconto: 0.5,
            nome: 'Garrafa Termica',
            preco: 22.99,
          ),
        ),
        VendaItem(
          quantidade: 22,
          produto: Produto(
            codigo: 1822,
            desconto: 0.5,
            nome: 'Caderno',
            preco: 39.12,
          ),
        ),
        VendaItem(
          quantidade: 12,
          produto: Produto(
            codigo: 1921,
            desconto: 0.5,
            nome: 'Caneta bic',
            preco: 2.99,
          ),
        )
      ]);
  print("O Valor total da venda é ${venda.valorTotal}");

  for (var i = 0; i < venda.itens!.length; i++) {
    print("Produtos: ${venda.itens![i].produto?.nome}");
  }
}
