import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/components/custom_buttons.dart';

class UserInputDialog extends StatelessWidget {
  final controller;
  VoidCallback onConfirm;
  VoidCallback onCancel;

  UserInputDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(),
      content: Container(
        height: 140,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(hintText: 'Create a new task'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DialogButton(onPressed: onConfirm, buttonText: 'Confirm'),
                  DialogButton(onPressed: onCancel, buttonText: 'Cancel')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
