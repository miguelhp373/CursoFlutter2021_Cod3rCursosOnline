import 'model/carro.dart';

main() {
  var carro1 = Carro(150);

  for (int i = 0; i < 100; i++) {
    print('${carro1.acelerarCarro()} KM');

    if (i == 6) {
      print('${carro1.frearCarro()} KM');
    }

    print(carro1.estaNoLimite());
  }
}
