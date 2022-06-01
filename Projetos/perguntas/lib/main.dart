import 'package:flutter/material.dart';
import 'package:perguntas/components/aswner_button.dart';
import 'package:perguntas/components/question_text.dart';

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

  void _aswnerSelect() {
    setState(() {
      if (_questionSelected < 1) {
        _questionSelected = 1;
      } else {
        _questionSelected = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //default const values on application
    double fixValueForMarginsTop = 10;
    const Color colorPrimaryButton = Colors.blueAccent;

    final List<String> questions = [
      'Qual sua Cor Favorita?',
      'Qual seu Animal Favorito?',
    ];

    final List<String> questionsAswer = [
      'Azul',
      'Preto',
      'Vermelho',
      'Cachorro',
      'Gato',
      'Passáro'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Perguntas'),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(fixValueForMarginsTop),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuestionText(questions[_questionSelected]),
                  SizedBox(height: fixValueForMarginsTop),
                  AswnerButton(
                      _questionSelected == 0
                          ? questionsAswer[0]
                          : questionsAswer[3],
                      _aswnerSelect,
                      ElevatedButton.styleFrom(primary: colorPrimaryButton)),
                  SizedBox(height: fixValueForMarginsTop),
                  AswnerButton(
                      _questionSelected == 0
                          ? questionsAswer[1]
                          : questionsAswer[4],
                      _aswnerSelect,
                      ElevatedButton.styleFrom(primary: colorPrimaryButton)),
                  SizedBox(height: fixValueForMarginsTop),
                  AswnerButton(
                      _questionSelected == 0
                          ? questionsAswer[2]
                          : questionsAswer[5],
                      _aswnerSelect,
                      ElevatedButton.styleFrom(primary: colorPrimaryButton))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
