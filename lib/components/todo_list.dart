import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  bool value;
  String task;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;
  TodoTile({
    required this.task,
    required this.value,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: onDelete,
              backgroundColor: Color(0xFFC04343),
              foregroundColor: Colors.white,
              icon: Icons.delete_forever_sharp,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          height: 100,
          width: double.infinity,
          color: Color(0xFFfffff),
          child: Row(
            children: [
              Checkbox(value: value, onChanged: onChanged),
              Flexible(
                child: Text(
                  task,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: value
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
