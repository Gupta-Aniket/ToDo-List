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
        backgroundColor: buttonText == "Confirm" ? WidgetStateProperty.all<Color>(Colors.blue) : null,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        style: TextStyle(fontFamily: 'Ubuntu', fontSize: 14, color: Colors.white),
        
        buttonText),
    );
  }
}
