import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  void addNewTask() {
    setState(() {
      db.todoTileList.add([_controller.text, false]);
    });
    _controller.clear();

    Navigator.of(context).pop();
    db.updateData();
  }

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
            onChanged: (value) =>
                checkBoxTicked(value, index), // idk how this works though
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takeUserInput,
        backgroundColor: Color(0xFFfffff),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white70,
        ),
      ),
    );
  }
}
