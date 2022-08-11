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
  final List<Transaction> _transactions = [];

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
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 *
              MediaQuery.of(context)
                  .textScaleFactor, //texto de acordo com a escala da fonte do dispositivo
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final availableHeight = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: availableHeight * 0.3,
              child: Chart(recentsTransactions: _recentTransactions),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: availableHeight * 0.7,
              child: TransactionList(
                transactions: _transactions,
                onRemove: _deleteTransaction,
              ),
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
