import 'package:bloc/bloc_pattern/ui/bloc_display_widget.dart';
import 'package:bloc/stateful/ui/plus_stateful_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BLoC Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: TextButton(
                child: const Text(
                  'General Stateful',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.grey[400]),
                onPressed: () {
                  Get.to(PlusStatefulDisplayWidget());
                },
              ),
            ),
            Center(
              child: TextButton(
                child: const Text(
                  'BLoC Pattern',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.grey[400]),
                onPressed: () {
                  Get.to(BlocDisplayWidget());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
