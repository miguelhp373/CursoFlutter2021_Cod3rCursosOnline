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
    //colors define
    const Color colorPrimaryText = Colors.white;
    const Color colorSecondaryButton = Colors.grey;
    const Color colorContainerCard = Colors.lightBlue;
    //List<type<datatype, key>>
    final List<Map<String, Object>> questions = [
      {
        'question': 'Qual sua Cor Favorita?',
        'aswner': ['Azul', 'Preto', 'Vermelho', 'Preto']
      },
      {
        'question': 'Qual seu Animal Favorito?',
        'aswner': ['Cachorro', 'Gato', 'Passáro', 'Coelho']
      }
    ];

    List<String> awsnerList = questions[_questionSelected].cast()['aswner'];

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 300,
                  margin: EdgeInsets.all(fixValueForMarginsTop),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: colorContainerCard,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QuestionText(
                            questions[_questionSelected]['question'].toString(),
                            colorPrimaryText,
                          ),
                          SizedBox(height: fixValueForMarginsTop),
                          ...awsnerList
                              .map(
                                (displayTextonButton) => AswnerButton(
                                  displayTextonButton,
                                  _aswnerSelect,
                                  ElevatedButton.styleFrom(
                                    primary: colorSecondaryButton,
                                    textStyle: const TextStyle(
                                        color: colorPrimaryText),
                                  ),
                                  fixValueForMarginsTop,
                                ),
                              )
                              .toList(), //spread
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
