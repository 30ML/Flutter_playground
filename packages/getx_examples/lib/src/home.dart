import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx2/src/pages/normal/first_page.dart';
import 'package:getx2/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* General Way */
            // ElevatedButton(
            //   child: const Text('General Flutter Route'),
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (_) => FirstPage()));
            //   },
            // ),
            /* GetX Route Way */
            ElevatedButton(
              child: const Text('GetX Route'),
              onPressed: () {
                Get.to(FirstPage());
              },
            ),
            /* General Named Route Way */
            // ElevatedButton(
            //   child: const Text('General Flutter Route'),
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/first');
            //   },
            // ),
            /* GetX Named Route Way */
            ElevatedButton(
              child: const Text('GetX Named Route'),
              onPressed: () {
                Get.toNamed('/first');
              },
            ),
            /* GetX Argument Passing */
            ElevatedButton(
              child: const Text('GetX Argument Passing(1)'),
              onPressed: () {
                Get.toNamed(
                  '/next',
                  // arguments: '30ML', // 1)
                  // arguments: 30, // 2)
                  // arguments: {"name": "30ML", "job": "Hacker"}, // 3)
                  arguments: User('30ML', 30), // 4)
                );
              },
            ),
            ElevatedButton(
              child: const Text('GetX Argument Passing(2) - 동적 URL'),
              onPressed: () {
                Get.toNamed('/user/374887301?name=jay&age=29');
              },
            ),
            ElevatedButton(
              child: const Text('Simple State Management'),
              onPressed: () {
                Get.to(SimpleStateManagePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;

  User(this.name, this.age);
}
