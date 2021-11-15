import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/src/pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            ElevatedButton(
              child: const Text('일반적인 라우트'),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => const FirstPage(),
                // ));
                Get.to(const FirstPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
