import 'package:flutter/material.dart';
import 'package:notes_app/components/custom_buttons.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(),
      content: Container(
        height: 120,
        width: 300,
        child: Column(
          children: [
            Text('Are you sure you want do delete all tasks ?'),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DialogButton(onPressed: onPressed, buttonText: 'Confirm'),
                DialogButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonText: 'Cancel'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
