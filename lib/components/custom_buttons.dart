import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  DialogButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });
  String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
