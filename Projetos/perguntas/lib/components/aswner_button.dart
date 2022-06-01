import 'package:flutter/material.dart';

class AswnerButton extends StatelessWidget {
  final String textDisplayOnButton;
  final void Function() onSelect;
  final ButtonStyle? defineStyleOnButton;

  const AswnerButton(
      this.textDisplayOnButton, this.onSelect, this.defineStyleOnButton,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: defineStyleOnButton,
        onPressed: onSelect,
        child: Text(textDisplayOnButton),
      ),
    );
  }
}
