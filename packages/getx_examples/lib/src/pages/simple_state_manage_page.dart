import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx2/src/pages/state/with_getx.dart';
import 'package:getx2/src/pages/state/with_provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: WithGetX()),
            Expanded(child: WithProvider()),
          ],
        ),
      ),
    );
  }
}
