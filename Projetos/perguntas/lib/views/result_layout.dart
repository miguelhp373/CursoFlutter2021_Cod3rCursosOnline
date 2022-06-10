import 'package:flutter/material.dart';
import 'package:perguntas/components/result_text.dart';

class ResultView extends StatelessWidget {
  ////////////////////
  final int points;
  //////////////
  const ResultView({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultText(points: points),
            const SizedBox(height: 12),
            Text(
              'Pontos Obtidos $points',
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
    //demonstrar acertos
  }
}
