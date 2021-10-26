import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'add_todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();

    return MaterialApp(
      routes: {
        '/': (context) => DatabaseApp(database),
        '/addTodo': (context) => AddTodoApp(database),
      },
    );
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, done INTEGER)');
      },
    );
  }
}

class DatabaseApp extends StatefulWidget {
  final Future<Database> db;
  DatabaseApp(this.db);

  @override
  _DatabaseAppState createState() => _DatabaseAppState();
}

class _DatabaseAppState extends State<DatabaseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQL Example'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final todo = await Navigator.of(context).pushNamed('/addTodo');
        },
      ),
    );
  }
}
