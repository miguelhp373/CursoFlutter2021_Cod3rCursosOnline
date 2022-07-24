import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  final void Function(String, double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _alertError(_) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Operação Cancelada!'),
              content: const Text('Titulo Vazio, ou Valor R\$ Menor que 0.'),
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
    final titleParamReturn = titleController.text;
    final valueParamReturn = double.tryParse(valueController.text) ?? 0.00;

    if (titleParamReturn.isEmpty || valueParamReturn <= 0) {
      _alertError(context); //msg de erro
      return;
    }

    widget.onSubmit(titleParamReturn, valueParamReturn);
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
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmit,
              controller: valueController,
              decoration: const InputDecoration(labelText: 'Valor R\$'),
            ),
            const SizedBox(height: 6),
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
