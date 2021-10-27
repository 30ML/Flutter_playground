import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'add_todo.dart';
import 'todo.dart';

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
            'CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, done INTEGER)');
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
  Future<List<Todo>>? todoList;

  @override
  void initState() {
    super.initState();

    todoList = getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQL Example'),
      ),
      body: Center(
        child: FutureBuilder(
          future: todoList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const CircularProgressIndicator();
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: (snapshot.data as List<Todo>).length,
                        itemBuilder: (context, index) {
                          Todo todo = (snapshot.data as List<Todo>)[index];
                          return ListTile(
                            title: Text(
                              todo.title!,
                              style: const TextStyle(fontSize: 20),
                            ),
                            subtitle: Column(
                              children: [
                                Text(todo.content!),
                                Text(
                                    'Done : ${todo.done == 1 ? 'true' : 'false'}'),
                                Container(
                                  height: 1,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            onTap: () async {
                              TextEditingController controller =
                                  TextEditingController(text: todo.content);
                              Todo result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('${todo.id}: ${todo.title}'),
                                    content: TextField(
                                      controller: controller,
                                      keyboardType: TextInputType.text,
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('Yes'),
                                        onPressed: () {
                                          setState(() {
                                            todo.done == 1
                                                ? todo.done = 0
                                                : todo.done = 1;
                                            todo.content =
                                                controller.value.text;
                                          });
                                          Navigator.of(context).pop(todo);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              _updateTodo(result);
                            },
                          );
                        })
                    : const Text('No Data');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final todo = await Navigator.of(context).pushNamed('/addTodo');
          if (todo != null) {
            _insertTodo(todo as Todo);
          }
        },
      ),
    );
  }

  void _insertTodo(Todo todo) async {
    // widget 을 이용하면 현재 State(_DatabaseAppState) 상위에 있는 StatefulWidget(DatabaseApp)에 있는 변수(db)를 사용할 수 있음
    final Database database = await widget.db;

    await database.insert('todo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    setState(() {
      todoList = getTodos();
    });
  }

  Future<List<Todo>> getTodos() async {
    final Database database = await widget.db;

    final List<Map<String, dynamic>> maps = await database.query('todo');

    return List.generate(maps.length, (index) {
      var map = maps[index];
      int done = map['done'] == 1 ? 1 : 0;
      return Todo(
        id: map['id'],
        title: map['title'].toString(),
        content: map['content'].toString(),
        done: done,
      );
    });
  }

  void _updateTodo(Todo todo) async {
    final Database database = await widget.db;

    await database.update(
      'todo',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );

    setState(() {
      todoList = getTodos();
    });
  }
}
