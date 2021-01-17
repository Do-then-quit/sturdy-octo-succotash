import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ToDoList extends StatefulWidget {
  ToDoList({Key key}) : super(key: key);
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Animate Slowly'),
      value: timeDilation != 1.0,
      onChanged: (bool value) {
        setState(() {
          timeDilation = value ? 10.0 : 1.0;
        });
      },
      secondary: const Icon(Icons.hourglass_empty),
    );
  }
}
