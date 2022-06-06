import 'package:flutter/material.dart';
import '../components/aswner_button.dart';
import '../components/question_text.dart';
import '../global/app_definitions.dart';

class AswnersLayout extends StatelessWidget {
  final int selectQuestionParam;
  final List<Map<String, Object>> questionsParam;
  final void Function() aswnerParam;

  const AswnersLayout(
      {required this.aswnerParam,
      required this.questionsParam,
      required this.selectQuestionParam,
      Key? key})
      : super(key: key);

  bool get selectedQuestion {
    return selectQuestionParam < questionsParam.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> awsnerList = selectedQuestion
        ? questionsParam[selectQuestionParam].cast()['aswner']
        : [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 300,
              margin: EdgeInsets.all(AppDefinitions.fixValueForMarginsTop),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppDefinitions.colorContainerCard,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
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
                        questionsParam[selectQuestionParam]['question']
                            .toString(),
                        AppDefinitions.colorPrimaryText,
                      ),
                      SizedBox(height: AppDefinitions.fixValueForMarginsTop),
                      ...awsnerList
                          .map(
                            (displayTextonButton) => AswnerButton(
                              questionsParam[selectQuestionParam]['aswner']
                                  .toString(),
                              aswnerParam,
                              ElevatedButton.styleFrom(
                                primary: AppDefinitions.colorSecondaryButton,
                                // textStyle: const TextStyle(
                                //   color: AppDefinitions.colorPrimaryText,
                                // ),
                              ),
                              AppDefinitions.fixValueForMarginsTop,
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
    );
  }
}
