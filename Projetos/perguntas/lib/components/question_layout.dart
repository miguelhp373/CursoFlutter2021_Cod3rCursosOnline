import 'package:flutter/material.dart';
import 'package:perguntas/components/question_button.dart';
import 'package:perguntas/components/question_text.dart';
import 'package:perguntas/global/app_definitions.dart';

class QuestionLayout extends StatelessWidget {
  ///////////////////////////////////////////
  //Params
  final List<Map<String, Object>> questionsList;
  final int selectedQuestionParam;
  final void Function(int) aswnerAction;
  ///////////////////////////////////////////
  const QuestionLayout(
      {Key? key,
      required this.questionsList,
      required this.selectedQuestionParam,
      required this.aswnerAction})
      : super(key: key);

  bool get selectedQuestion {
    return selectedQuestionParam < questionsList.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listReturnQuestions = selectedQuestion
        ? questionsList[selectedQuestionParam].cast()['aswner']
        : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuestionText(
          questionsList[selectedQuestionParam]['question'].toString(),
          AppDefinitions.colorPrimaryText,
        ),
        SizedBox(height: AppDefinitions.fixValueForMarginsTop),
        ...listReturnQuestions
            .map(
              (resp) => QuestionButton(
                aswnerText: resp['text'].toString(),
                selectQuestion: () =>
                    aswnerAction(int.parse(resp['points'].toString())),
              ),
            )
            .toList(),
        SizedBox(height: AppDefinitions.fixValueForMarginsTop),
      ],
    );
  }
}
