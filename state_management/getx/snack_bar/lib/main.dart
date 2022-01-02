import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Snack Bar",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("GetX - Snack Bar"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar("It's Snack Bar", "Hello Snack Bar");
                  },
                  child: const Text("Show Snack Bar"),
                ),
              ],
            ),
          )),
    );
  }
}
