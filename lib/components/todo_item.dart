import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  final String todoName;
  final bool isSelected;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  TodoItem(
      {required this.todoName,
      required this.isSelected,
      required this.onChanged,
      required this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            padding: const EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(10),
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.black45,
                  value: isSelected,
                  onChanged: onChanged),
              Text(todoName, style: TextStyle(decoration: isSelected ? TextDecoration.lineThrough :  TextDecoration.none),)
            ],
          ),
        ),
      ),
    );
  }
}
