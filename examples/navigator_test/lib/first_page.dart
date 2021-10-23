import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> todoList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    todoList.add('당근 사오기');
    todoList.add('약 사오기');
    todoList.add('청소하기');
    todoList.add('빨래하기');
    todoList.add('부모님께 전화하기');
  }

  void _addNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(result as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: Text(
                todoList[index],
                style: const TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/third', arguments: todoList[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _addNavigation(context);
        },
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     child: const Text('Go to second page'),
      //     onPressed: () {
      //       Navigator.of(context).pushNamed('/second');
      //     },
      //   ),
      // ),
    );
  }
}
