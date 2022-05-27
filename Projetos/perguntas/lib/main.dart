import 'package:flutter/material.dart';

main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  int questionSelected = 0;

  void aswnerSelect() {
    setState(() {
      if (questionSelected < 1) {
        questionSelected = 1;
      } else {
        questionSelected = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double fixValueForMarginsTop = 10;

    final List<String> questions = [
      'Qual sua Cor Favorita?',
      'Qual seu Animal Favorito?',
    ];

    final List<String> questionsAswer = [
      'xxxxxxxxxxx',
      'xxxxxxxxxxx',
      'xxxxxxxxxxx',
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
                  Text(questions[questionSelected]),
                  SizedBox(height: fixValueForMarginsTop),
                  ElevatedButton(
                    onPressed: aswnerSelect,
                    child: Text(questionsAswer[0]),
                  ),
                  SizedBox(height: fixValueForMarginsTop),
                  ElevatedButton(
                    onPressed: aswnerSelect,
                    child: Text(questionsAswer[1]),
                  ),
                  SizedBox(height: fixValueForMarginsTop),
                  ElevatedButton(
                    onPressed: aswnerSelect,
                    child: Text(questionsAswer[2]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
