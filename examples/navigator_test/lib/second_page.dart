import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              child: const Text('저장하기'),
              onPressed: () {
                Navigator.of(context).pop(controller.value.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
