import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Dialog Box",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dialog Box"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Dialog Title",
                    titleStyle: const TextStyle(fontSize: 18),
                    middleText: "This will be Middle Area",
                    middleTextStyle: const TextStyle(fontSize: 19),
                    backgroundColor: Colors.blueGrey,
                    buttonColor: Colors.pink,
                    radius: 80,
                    textCancel: "NO",
                    cancelTextColor: Colors.white,
                    textConfirm: "YES",
                    confirmTextColor: Colors.white,
                    onCancel: () {},
                    onConfirm: () {},
                  );
                },
                child: const Text("This is show dialog button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
