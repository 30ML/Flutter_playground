import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explicit Animation - RotationTransition'),
        ),
        body: RotationTransition(
          turns: _controller,
          alignment: Alignment.center,
          child: Center(
            child: IconButton(
              onPressed: () {
                _controller.duration!.inSeconds == 1
                    ? _controller.duration = const Duration(seconds: 3)
                    : _controller.duration = const Duration(seconds: 1);
                _controller.repeat();
              },
              icon: const Icon(Icons.sentiment_satisfied),
              color: Colors.blue,
              iconSize: 200,
            ),
          ),
        ),
      ),
    );
  }
}
