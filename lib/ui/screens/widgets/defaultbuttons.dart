import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onpressed;
  final Widget child;
  final Color color;
  final Color textColor;

  const DefaultButton(
      {Key? key,
      required this.onpressed,
      required this.child,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: child,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            color: textColor
          )
        )
      ),
    );
  }
}
