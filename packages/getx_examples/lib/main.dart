import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_examples/src/home.dart';
import 'package:getx_examples/src/pages/named/first_named_page.dart';
import 'package:getx_examples/src/pages/named/second_named_page.dart';
import 'package:getx_examples/src/pages/next_page.dart';
import 'package:getx_examples/src/pages/user_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Home(),
      initialRoute: '/',
      /* General Way */
      // routes: {
      //   '/': (context) => Home(),
      //   'first': (context) => FirstNamedPage(),
      //   'second': (context) => SecondNamedPage(),
      // },
      /* GetX Way */
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/first',
          page: () => const FirstNamedPage(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: '/second',
          page: () => const SecondNamedPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/next',
          page: () => const NextPage(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/user/:uid',
          page: () => const UserPage(),
        ),
      ],
    );
  }
}
