import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Implicit Animation - built-in(AnimatedContainer)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Implicit Animation - built-in(AnimatedContainer)'),
        ),
        body: GestureDetector(
          onTap: () {
            selected = !selected;
            setState(() {});
          },
          // child: Container(
          child: AnimatedContainer(
            // Built-in Implicit Animation
            child: const Text(
              'This is AnimatedContainer Example.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            padding: const EdgeInsets.all(80),
            margin: const EdgeInsets.all(50),
            color: Colors.blue,
            width: selected ? 250 : 310,
            height: selected ? 250 : 310,
            duration: const Duration(milliseconds: 500), // (+)
          ),
        ),
      ),
    );
  }
}
