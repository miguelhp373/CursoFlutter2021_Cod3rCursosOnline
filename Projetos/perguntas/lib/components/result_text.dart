import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final int points;
  const ResultText({Key? key, required this.points}) : super(key: key);

  String get returnTextOnResult {
    if (points < 10) {
      return 'Não foi desta Vez, Tente Novamente!';
    } else if (points == 10) {
      return 'Você é Bom!';
    } else if (points == 20) {
      return 'Impressionante!';
    } else {
      return 'Parabéns! 👏, Você Completou O Quiz!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(returnTextOnResult,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
