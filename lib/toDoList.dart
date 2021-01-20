import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Todo {
  bool isDone;
  String title;

  Todo(this.title, {this.isDone = false});
}

class ToDoList extends StatefulWidget {
  ToDoList({Key key}) : super(key: key);
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  var _todoController = TextEditingController();
  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo(Todo todo) {
    FirebaseFirestore.instance
        .collection('todo')
        .add({'title': todo.title, 'isDone': todo.isDone});
    _todoController.text = '';
  }

  void _deleteTodo(DocumentSnapshot doc) {
    FirebaseFirestore.instance.collection('todo').doc(doc.id).delete();
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final todo = Todo(doc['title'], isDone: doc['isDond']);
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
              onPressed: () => _deleteTodo(doc),
            ),
            onChanged: (bool value) => {
              FirebaseFirestore.instance
                  .collection('todo')
                  .doc(doc.id)
                  .update({'isDone': value}),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('todo').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Something Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              var documents = snapshot.data.documents;

              return Expanded(
                child: Scrollbar(
                  child: ListView(
                    children:
                        documents.map((doc) => _buildItemWidget(doc)).toList(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              );
            })
      ],
    );
  }
}
