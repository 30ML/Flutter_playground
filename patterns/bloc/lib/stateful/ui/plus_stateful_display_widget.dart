import 'package:flutter/material.dart';

class PlusStatefulDisplayWidget extends StatefulWidget {
  const PlusStatefulDisplayWidget({Key? key}) : super(key: key);

  @override
  _PlusStatefulDisplayWidgetState createState() =>
      _PlusStatefulDisplayWidgetState();
}

class _PlusStatefulDisplayWidgetState extends State<PlusStatefulDisplayWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Stateful'),
      ),
      body: Container(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                count += 1;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                count -= 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
