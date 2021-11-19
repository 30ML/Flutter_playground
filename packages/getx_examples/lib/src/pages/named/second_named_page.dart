import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx2/src/home.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go Back'),
              onPressed: () {
                Get.back(); // GetX Way // context 접근이 없음
                // Navigator.of(context).pop(); // General Way
              },
            ),
            ElevatedButton(
              child: const Text('Go to Home'),
              onPressed: () {
                Get.offAllNamed('/'); // GetX Way
              },
            ),
          ],
        ),
      ),
    );
  }
}
