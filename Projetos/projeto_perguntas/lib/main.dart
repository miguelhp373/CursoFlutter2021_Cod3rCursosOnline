import 'package:flutter/material.dart';

main() {
  runApp(const PergutasApp()); //aqui chama o widget que starta a aplicação
}

class PergutasApp extends StatelessWidget {
  const PergutasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //metodo
    return const MaterialApp(
      home: Text('Hello World'), //pagina inicial
    );
  }
}
