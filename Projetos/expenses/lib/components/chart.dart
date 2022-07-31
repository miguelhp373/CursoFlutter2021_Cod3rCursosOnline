import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentsTransactions}) : super(key: key);

  final List<Transaction> recentsTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, //7dias
        (index) {
      //pega o dia da semana
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.00;

      for (var i = 0; i < recentsTransactions.length; i++) {
        //verifica se a data é igual a proprio dia
        bool sameDay = recentsTransactions[i].date.day == weekDay.day;

        //verifica se a data é igual a proprio mês
        bool sameMonth = recentsTransactions[i].date.month == weekDay.month;

        //verifica se a data é igual a proprio Ano
        bool sameYear = recentsTransactions[i].date.year == weekDay.year;

        if (sameDay == true && sameMonth == true && sameYear == true) {
          totalSum += recentsTransactions[i].value;
        }
      }

      return {
        //pega a primeira letra do dia da semana
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.00, (sum, transaction) {
      return sum + double.parse(transaction['value'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((trs) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: trs['day'].toString(),
                value: double.parse(trs['value'].toString()),
                percentege: _weekTotalValue == 0
                    ? 0
                    : (trs['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
