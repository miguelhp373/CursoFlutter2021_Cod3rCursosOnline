import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String textQuestionDisplay;
  final Color textColorDefine;
  const QuestionText(this.textQuestionDisplay, this.textColorDefine, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textQuestionDisplay,
      style: TextStyle(
        fontSize: 18,
        color: textColorDefine,
      ),
    );
  }
}
