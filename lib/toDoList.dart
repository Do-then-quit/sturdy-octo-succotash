import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Todo {
  bool isDone = false;
  String title;

  Todo(this.title);
}

final _items = <Todo>[];

class ToDoList extends StatefulWidget {
  ToDoList({Key key}) : super(key: key);
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = "";
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  Widget _buildItemWidget(Todo todo) {
    return Column(
      children: [
        Container(
          color: Colors.blue[100],
          child: CheckboxListTile(
            activeColor: Colors.blue,
            value: todo.isDone,
            title: Text(todo.title),
            secondary: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () => _deleteTodo(todo),
            ),
            onChanged: (bool newValue) {
              setState(() {
                todo.isDone = newValue;
              });
            },
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _todoController,
              ),
            ),
            RaisedButton(
              onPressed: () => _addTodo(Todo(_todoController.text)),
              child: Text("add"),
            ),
          ],
        ),
        Expanded(
          child: Scrollbar(
            child: ListView(
              children: _items.map((todo) => _buildItemWidget(todo)).toList(),
              padding: EdgeInsets.all(10),
            ),
          ),
        )
      ],
    );
  }
}
