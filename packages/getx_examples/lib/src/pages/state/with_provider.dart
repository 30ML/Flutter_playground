import 'package:flutter/material.dart';
import 'package:getx_examples/src/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Provider', style: TextStyle(fontSize: 20)),
          Text(
            '${Provider.of<CountControllerWithProvider>(context).count}',
            style: const TextStyle(fontSize: 50),
          ),
          // Consumer<CountControllerWithProvider>(builder: (_, snapshot, child) {
          //   return Text(
          //     '${snapshot.count}',
          //     style: const TextStyle(fontSize: 50),
          //   );
          // }),
          ElevatedButton(
            child: const Text('+', style: TextStyle(fontSize: 30)),
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false)
                  .increase();
            },
          ),
        ],
      ),
    );
  }
}
