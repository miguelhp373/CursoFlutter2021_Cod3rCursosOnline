import 'package:flutter/material.dart';

main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatelessWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text('hello World!'),
    );
  }
}
