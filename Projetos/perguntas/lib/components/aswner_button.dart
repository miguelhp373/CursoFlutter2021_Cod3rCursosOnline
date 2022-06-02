import 'package:flutter/material.dart';

class AswnerButton extends StatelessWidget {
  final String textDisplayOnButton;
  final void Function() onSelect;
  final ButtonStyle? defineStyleOnButton;
  final double marginTopOnSizedBox;

  const AswnerButton(this.textDisplayOnButton, this.onSelect,
      this.defineStyleOnButton, this.marginTopOnSizedBox,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: marginTopOnSizedBox),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            style: defineStyleOnButton,
            onPressed: onSelect,
            child: Text(textDisplayOnButton),
          ),
        )
      ],
    );
  }
}
