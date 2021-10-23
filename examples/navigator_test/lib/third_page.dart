import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Text(args, style: const TextStyle(fontSize: 30)),
        // child: ElevatedButton(
        //   child: const Text('Go to First Page'),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
    );
  }
}
