import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String textQuestionDisplay;
  const QuestionText(this.textQuestionDisplay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textQuestionDisplay,
      style: const TextStyle(fontSize: 18),
    );
  }
}
