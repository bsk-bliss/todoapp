import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/components/custom_dialog.dart';
import 'package:todoapp/components/todo_item.dart';
import 'package:todoapp/data/todo_database.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  TodoDatabase db = TodoDatabase();
  var mybox = Hive.box("hello");

  @override
  void initState() {
    if (mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text("TO DO")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => createDialog(),
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
              todoName: db.todoList[index][0],
              isSelected: db.todoList[index][1],
              onChanged: (value) => onCheckboxChanged(index),
              onDelete: (context) => onDeleteTodo(index),
            );
          }),
    );
  }

  void onCheckboxChanged(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateData();
    });
  }

  void createDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            controller: controller,
            onSaved: () => onSaveTodo(),
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void onSaveTodo() {
    setState(() {
      String todo = controller.text;
      if (todo.isNotEmpty) {
        db.todoList.add([todo, false]);
        db.updateData();
        controller.clear();
      }
    });
    Navigator.of(context).pop();
  }

  void onDeleteTodo(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateData();
    });
  }
}
