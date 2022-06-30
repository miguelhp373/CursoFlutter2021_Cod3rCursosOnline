import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            child: Text('Gráfico'),
            elevation: 5,
          ),
        ),
        Card(
          color: Colors.blue,
          child: Text('Lista de Transações'),
          elevation: 5,
        )
      ]),
    );
  }
}
