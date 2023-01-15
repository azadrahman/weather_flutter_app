import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final String title;
  final bool isChecked;
  final void Function(bool?) toggleCheckState;
  final Function()? onPressCallback;


  NoteList({required this.title, required this.isChecked, required this.toggleCheckState, this.onPressCallback});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onLongPress: onPressCallback,
        title: Text(title, style: TextStyle(color: isChecked ? Colors.black38 : Colors.black, decoration: isChecked ? TextDecoration.lineThrough : null),),
        trailing: Checkbox(
          fillColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
          value: isChecked,
          onChanged: toggleCheckState,
        ),
      );
  }
}

