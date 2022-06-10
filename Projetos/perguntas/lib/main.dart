import 'package:flutter/material.dart';
import 'package:perguntas/components/question_layout.dart';
import 'package:perguntas/global/app_definitions.dart';
import 'package:perguntas/views/result_layout.dart';

main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  //inicialized variable
  int _questionSelected = 0;
  int _finalpontuation = 0;

  //List<type<datatype, key>>
  final _questions = const [
    {
      'question': 'De onde é a invenção do chuveiro elétrico?',
      'aswner': [
        {'text': 'França', 'points': 0},
        {'text': 'Inglaterra', 'points': 0},
        {'text': 'Brasil', 'points': 10},
        {'text': 'Austrália', 'points': 0},
      ],
      'correct': 'Brasil'
    },
    {
      'question': 'Quais o menor e o maior país do mundo?',
      'aswner': [
        {'text': 'Vaticano e Rússia', 'points': 10},
        {'text': 'Nauru e China', 'points': 0},
        {'text': 'Malta e Estados Unidos', 'points': 0},
        {'text': 'São Marino e Índia', 'points': 0},
      ],
      'correct': 'Vaticano e Rússia'
    },
    {
      'question': 'Em que período da pré-história o fogo foi descoberto?',
      'aswner': [
        {'text': 'Neolítico', 'points': 0},
        {'text': 'Paleolítico', 'points': 10},
        {'text': 'Período da Pedra Polida', 'points': 0},
        {'text': 'Idade dos Metais', 'points': 0},
      ],
      'correct': 'Paleolítico'
    },
  ];

  void _aswnerSelect(int pontuation) {
    if (selectedQuestion) {
      setState(() {
        _questionSelected++;
        _finalpontuation += pontuation;
      });
    }
  }

  bool get selectedQuestion {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppDefinitions.appBarPrimaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppDefinitions.appBarPrimaryColor,
          title: const Text('Jogo de Perguntas Gerais'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: selectedQuestion
                    ? null
                    : () => {
                          setState(() {
                            _questionSelected = 0;
                          })
                        },
                icon: const Icon(
                  Icons.autorenew,
                  size: 26.0,
                ),
              ),
            )
          ],
        ),
        body: selectedQuestion
            ? QuestionLayout(
                questionsList: _questions,
                selectedQuestionParam: _questionSelected,
                aswnerAction: _aswnerSelect,
              )
            : ResultView(points: _finalpontuation),
      ),
    );
  }
}
