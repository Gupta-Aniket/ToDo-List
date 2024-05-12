import 'package:hive_flutter/hive_flutter.dart';

class TodoListDatabase {
  List todoTileList = [];
  final _myBox = Hive.box('myBox');
  int n = 0;
  void createInitData() {
    // first time the app is opened (first time ever)
    todoTileList = [
      ['this is task 1', false],
      ['swipe from right to left to delete (<-)', false],
      ['hold [+] button to delete all tasks', false],
      ['hold the bin icon to again swtich to [+] icon', false],
      ['use [+] icon to add new tasks', false],
      ['use the checkbox to write off the tasks', false],
    ];
  }

  void loadData() {
    todoTileList = _myBox.get('TODOLIST');
    n = todoTileList.length;
  }

  void updateData() {
    _myBox.put('TODOLIST', todoTileList);
  }

  void deleteAll() {
    _myBox.clear();
  }
}
