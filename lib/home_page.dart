import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/components/confirm_dialog.dart';
import 'package:notes_app/components/todo_list.dart';
import 'package:notes_app/data/database.dart';

import 'components/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  //referencing / accessing hive box
  var _myBox = Hive.box('myBox');

  //creating a ref of the database class
  TodoListDatabase db = TodoListDatabase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitData();
    } else {
      //a database already exists
      db.loadData();
    }
    super.initState();
  }

  String fabTask = 'add';
  Icon fabIcon = Icon(
    Icons.add,
    size: 30,
    color: Colors.white70,
  );

  // taking user input
  void takeUserInput() {
    showDialog(
      context: context,
      builder: (BuildContext) {
        return UserInputDialog(
          controller: _controller,
          onConfirm: addNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  void addNewTask() {
    // print('add new task called');
    setState(() {
      db.todoTileList.add([_controller.text, false]);
    });
    _controller.clear();

    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteAllTask() {
    // delete all the tasks
    showDialog(
      context: context,
      builder: (BuildContext) {
        return ConfirmDialog(
          onPressed: () {
            setState(() {
              db.todoTileList.clear();
            });
            db.updateData();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void fabPressed(String task) {
    if (task == 'delete') {
      deleteAllTask();
    } else {
      //task == add
      takeUserInput();
    }
  }

  // checking if the box is ticked or not
  void checkBoxTicked(bool? value, int index) {
    setState(() {
      db.todoTileList[index][1] = !db.todoTileList[index][1];
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoTileList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do',
          style: TextStyle(fontFamily: 'Ubuntu', fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.todoTileList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            task: db.todoTileList[index][0],
            value: db.todoTileList[index][1],
            onChanged: (value) => checkBoxTicked(value, index),
            // idk how this works though
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: InkWell(
        splashColor: Colors.blueAccent,
        onLongPress: () {
          if (fabTask == 'add') {
            setState(() {
              fabIcon = Icon(
                Icons.delete_sweep_rounded,
                size: 30,
                color: Colors.redAccent,
              );
            });
            fabTask = 'delete';
          } else {
            fabTask = 'add';
            setState(() {
              fabIcon = Icon(
                Icons.add,
                size: 30,
                color: Colors.white70,
              );
            });
          }
        },
        child: FloatingActionButton(
          onPressed: () => fabPressed(fabTask),
          backgroundColor: Color(0xFFfffff),
          child: fabIcon,
        ),
      ),
    );
  }
}
