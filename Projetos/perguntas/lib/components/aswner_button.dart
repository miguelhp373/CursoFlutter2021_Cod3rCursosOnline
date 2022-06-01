import 'package:flutter/material.dart';

class AswnerButton extends StatelessWidget {
  final String textDisplayOnButton;
  final void Function() onSelect;
  final ButtonStyle? style;

  const AswnerButton(this.textDisplayOnButton, this.onSelect, this.style,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        style: style,
        onPressed: onSelect, //_aswnerSelect,
        child: Text(textDisplayOnButton),
      ),
    );
  }
}
