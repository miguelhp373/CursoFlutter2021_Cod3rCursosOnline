import 'package:flutter/material.dart';
import 'package:perguntas/views/aswners_layout.dart';

main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  int _questionSelected = 0;

  //List<type<datatype, key>>
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Qual sua Cor Favorita?',
      'aswner': ['Azul', 'Preto', 'Vermelho', 'Preto']
    },
    {
      'question': 'Qual seu Animal Favorito?',
      'aswner': ['Cachorro', 'Gato', 'Passáro', 'Coelho']
    }
  ];

  void _aswnerSelect() {
    setState(() {
      _questionSelected++;
    });
  }

  bool get selectedQuestion {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [const Text('Perguntas')],
          ),
        ),
        body: selectedQuestion
            ? AswnersLayout(
                aswnerParam: _aswnerSelect,
                questionsParam: _questions,
                selectQuestionParam: _questionSelected,
              )
            : const Center(
                child: Text('Parabéns!'),
              ),
      ),
    );
  }
}
