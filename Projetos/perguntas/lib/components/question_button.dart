import 'package:flutter/material.dart';
import 'package:perguntas/global/app_definitions.dart';

class QuestionButton extends StatelessWidget {
  /////////////////////////////
  /// Params
  final String aswnerText;
  final void Function() selectQuestion;
  /////////////////////////////
  const QuestionButton(
      {Key? key, required this.aswnerText, required this.selectQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: AppDefinitions.fixValueForMarginsTop),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppDefinitions.colorPrimaruButton),
                  ),
                  onPressed: selectQuestion,
                  child: Text(
                    aswnerText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
