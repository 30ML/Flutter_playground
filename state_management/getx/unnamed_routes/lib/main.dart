import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnamed_routes/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX - Route Navigation For Unnamed Routes",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetX - Route Navigation For Unnamed Routes"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(HomePage());
                },
                child: const Text("Go to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
