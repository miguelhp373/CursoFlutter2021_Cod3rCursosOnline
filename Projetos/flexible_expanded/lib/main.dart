import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: Text('Item 1 - Pretty Big'),
          ),
          Flexible(
            //padrão loose - ocupa tamanho necessário
            //tight ocupa todo espaço - expande
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Text('Item 2'),
            ),
          ),
          Expanded(
            //fit: FlexFit.tight, propriedade padrão
            flex: 2,
            child: Container(
              height: 100,
              color: Colors.orange,
              child: Text('Item 3'),
            ),
          )
        ],
      ),
    );
  }
}
