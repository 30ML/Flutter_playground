import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/count_provider.dart';
import 'package:provider_example/src/count_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Home Widget build!!!');
    CountProvider _countProvider = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: CountView(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _countProvider.add(),
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => _countProvider.subtract(),
          ),
        ],
      ),
    );
  }
}
