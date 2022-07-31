import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

import '../models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'OpenSans',
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Ifood',
      value: 59.82,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: '4565432',
      title: 'Ifood',
      value: 59.82,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: '25445',
      title: 'Ifood',
      value: 59.82,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: '2342342',
      title: 'Ifood',
      value: 59.82,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: '21212',
      title: 'Ifood',
      value: 59.82,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: '123122',
      title: 'Ifood',
      value: 59.82,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((tr) =>
            tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  _addTransaction(
      String titleParam, double valueParam, DateTime datetimeParam) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: titleParam,
        value: valueParam,
        date: datetimeParam);

    setState(() {
      try {
        _transactions.add(newTransaction);
      } on Exception catch (_) {}
    });

    Navigator.of(context).pop(); //fecha o modal
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transactionId) => transactionId.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentsTransactions: _recentTransactions),
            TransactionList(
              transactions: _transactions,
              onRemove: _deleteTransaction,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
