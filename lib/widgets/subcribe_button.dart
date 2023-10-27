import 'package:flutter/material.dart';
enum SubButtonType { small, medium }
class SubscribeButton extends StatelessWidget {
  final Color buttonColor;
  final Function() onclick;
  final String buttonName;
  final Color buttonNameColor;
  final BorderSide? border;
  final SubButtonType type;
  const SubscribeButton({
    super.key,
    required this.buttonColor,
    required this.buttonName,
    required this.onclick,
    required this.buttonNameColor,
    required this.border, required this.type,
  });
  @override
  Widget build(BuildContext context) {
    final double checkWith = type == SubButtonType.small ? 76 : 108;
    final double checkHeight = type == SubButtonType.small ? 28 : 32;
    final double checkFontSize = type == SubButtonType.small ? 12 : 16;
    return SizedBox(
      width: checkWith,
      height: checkHeight,
      child: ElevatedButton(
        onPressed: onclick,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor,
            padding: EdgeInsets.zero,
            side: border),
        child: Text(buttonName,
            style: TextStyle(fontSize: checkFontSize, color: buttonNameColor)),
      ),
    );
  }
}
