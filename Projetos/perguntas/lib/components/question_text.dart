import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String textQuestionDisplay;
  final Color textColorDefine;
  const QuestionText(this.textQuestionDisplay, this.textColorDefine, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            textQuestionDisplay,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            style: TextStyle(
              fontSize: 18,
              color: textColorDefine,
            ),
          ),
        ),
      ],
    );
  }
}
