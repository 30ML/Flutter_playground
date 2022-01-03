import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_state_manager/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX - Reactive State Manager By Using GetX Controller",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              "GetX - Reactive State Manager By Using GetX Controller"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetX<Controller>(
                // init: Controller(),
                builder: (controller) {
                  return Text(
                    "The Value is ${controller.count}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Get.find<Controller>().increment();
                  controller.increment();
                },
                child: const Text("Increment Button"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Get.find<Controller>().decrement();
                  controller.decrement();
                },
                child: const Text("Decrement Button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
