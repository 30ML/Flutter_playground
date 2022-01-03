import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var count = 0.obs;

  void increament() {
    count += 1;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX - State Management > Reactive",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetX - State Management > Reactive"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  "Count value is $count",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  increament();
                },
                child: const Text("Increament Button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
