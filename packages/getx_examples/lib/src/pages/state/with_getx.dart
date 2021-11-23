import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('GetX', style: TextStyle(fontSize: 20)),
          GetBuilder(builder: (controller) {
            return const Text('0', style: TextStyle(fontSize: 50));
          }),
          // const Text('0', style: TextStyle(fontSize: 50)),
          ElevatedButton(
            onPressed: () {},
            child: const Text('+', style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
