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
      body: CountViewStateless(count: count),
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

class CountViewStateless extends StatelessWidget {
  int count;

  CountViewStateless({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CountViewStateless Build!!');
    return Center(
      child: Text(
        count.toString(),
        style: const TextStyle(fontSize: 80),
      ),
    );
  }
}
