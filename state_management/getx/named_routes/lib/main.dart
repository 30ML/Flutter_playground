import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:named_routes/dash_board_page.dart';
import 'package:named_routes/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX - Route Navigation For Named Routes",
      initialRoute: "/",
      defaultTransition: Transition.rightToLeftWithFade,
      getPages: [
        GetPage(name: "/", page: () => const MyApp()),
        GetPage(name: "/HomePage", page: () => HomePage()),
        GetPage(name: "/DashBoardPage", page: () => DashBoardPage()),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetX - Route Navigation For Named Routes"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Get.toNamed("/HomePage"),
                child: const Text("Go to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
