import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDateTimeonPicker = DateTime.now();

  _alertError(_) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Operação Cancelada!'),
              content: const Text(
                'Titulo Vazio, Valor R\$ Menor que 0. ou Data Inválida!',
              ),
              actions: <Widget>[
                // TextButton(
                //   onPressed: () => Navigator.pop(context, 'Cancel'),
                //   child: Text('Cancel'),
                // ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  _onSubmit() {
    final titleParamReturn = _titleController.text;
    final valueParamReturn = double.tryParse(_valueController.text) ?? 0.00;
    final datetimeReturn = _selectedDateTimeonPicker;

    if (titleParamReturn.isEmpty || valueParamReturn <= 0) {
      _alertError(context); //msg de erro
      return;
    }

    widget.onSubmit(titleParamReturn, valueParamReturn, datetimeReturn);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        } else {
          setState(() {
            _selectedDateTimeonPicker = pickedDate;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmit,
              controller: _valueController,
              decoration: const InputDecoration(labelText: 'Valor R\$'),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text(
                  'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDateTimeonPicker)}',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: const Text(
                      'Selecione Uma Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _showDatePicker,
                  ),
                )
              ]),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _onSubmit,
                  child: const Text('Nova Transação'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
