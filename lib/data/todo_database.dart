import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  var mybox = Hive.box("hello");

  void createInitialData() {
    todoList = [
      ["Exercise", false],
      ["Youtube", false],
      ["cooking", false]
    ];
  }

  void loadData() {
    todoList = mybox.get("TODOLIST");
  }

  void updateData() {
    mybox.put("TODOLIST",todoList);
  }
}
