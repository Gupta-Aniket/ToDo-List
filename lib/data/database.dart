import 'package:hive_flutter/hive_flutter.dart';

class TodoListDatabase {
  List todoTileList = [];
  final _myBox = Hive.box('myBox');

  void createInitData() {
    // first time the app is opened (first time ever)
    todoTileList = [
      ['this is task 1', false],
      ['swipe from right to left to delete (<-)', false],
    ];
  }

  void loadData() {
    todoTileList = _myBox.get('TODOLIST');
  }

  void updateData() {
    _myBox.put('TODOLIST', todoTileList);
  }
}
