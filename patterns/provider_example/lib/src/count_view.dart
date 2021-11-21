import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/count_provider.dart';

class CountView extends StatelessWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CountView Widget build!!!');
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, provider, child) {
          return Text(
            provider.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        },
      ),
      // child: Text(
      //   Provider.of<CountProvider>(context).count.toString(),
      //   style: const TextStyle(fontSize: 50),
      // ),
    );
  }
}
