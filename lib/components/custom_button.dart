// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  VoidCallback onClicked;
  CustomButton({required this.title, required this.onClicked, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(title),
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor),
    );
  }
}
