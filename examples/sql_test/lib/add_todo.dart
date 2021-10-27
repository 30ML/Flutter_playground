import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'todo.dart';

class AddTodoApp extends StatefulWidget {
  final Future<Database> db;

  AddTodoApp(this.db);

  @override
  _AddTodoAppState createState() => _AddTodoAppState();
}

class _AddTodoAppState extends State<AddTodoApp> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Task'),
              ),
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                Todo todo = Todo(
                  title: titleController?.value.text,
                  content: contentController?.value.text,
                  done: 0,
                );
                Navigator.of(context).pop(todo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
