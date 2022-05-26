import 'package:flutter/material.dart';

main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatelessWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  void aswnerQuestion() {}

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
          title: Text('Perguntas'),
        ),
        body: Container(
          margin: EdgeInsets.all(fixValueForMarginsTop),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(questions[0]),
                  SizedBox(height: fixValueForMarginsTop),
                  ElevatedButton(
                    onPressed: () => {aswnerQuestion()},
                    child: Text(questionsAswer[0]),
                  ),
                  SizedBox(height: fixValueForMarginsTop),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(questionsAswer[1]),
                  ),
                  SizedBox(height: fixValueForMarginsTop),
                  ElevatedButton(
                    onPressed: () => {},
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
