import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                    onPressed: onConfirm,
                    child: Text('Confirm'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                    onPressed: onCancel,
                    child: Text('Cancel'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
