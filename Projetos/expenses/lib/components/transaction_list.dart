import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(
      {Key? key, required this.transactions, required this.onRemove})
      : super(key: key);

  final List<Transaction> transactions;

  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return transactions.isEmpty
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/waiting.png',
                height: 100,
                width: 100,
              ),
              const Text('Nenhuma Transação Cadastrada!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ))
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('R\$ ${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => onRemove(tr.id),
                    )),
              );
            },
          );
  }
}
