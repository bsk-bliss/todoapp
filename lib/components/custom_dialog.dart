// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/components/custom_button.dart';

class CustomDialog extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  CustomDialog({required this.controller, required this.onSaved, required this.onCancel, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        padding: const EdgeInsets.only(top: 10.0),
        height: 130,
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter a todo",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
                  height: 10,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: "SAVE",
                  onClicked: onSaved,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomButton(
                  title: "CANCEL",
                  onClicked: onSaved,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
