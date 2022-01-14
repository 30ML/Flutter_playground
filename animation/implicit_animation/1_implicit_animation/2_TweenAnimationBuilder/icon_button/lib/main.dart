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
  double sizeValue = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Implicit Animation - TweenAnimationBuilder(iconButton)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Implicit Animation - TweenAnimationBuilder(iconButton)'),
        ),
        body: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: sizeValue),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, double size, Widget? childWidget) {
              return IconButton(
                onPressed: () {
                  sizeValue = sizeValue == 100 ? 200 : 100;
                  setState(() {});
                },
                icon: childWidget!,
                iconSize: size,
                color: Colors.blue,
              );
            },
            child: const Icon(Icons.sentiment_satisfied), // pre-built child
          ),
          // child: TweenAnimationBuilder(
          //   tween: Tween<double>(begin: 0, end: sizeValue),
          //   duration: const Duration(seconds: 1),
          //   builder: (_, double size, __) {
          //     return IconButton(
          //       onPressed: () {
          //         sizeValue = sizeValue == 100 ? 200 : 100;
          //         setState(() {});
          //       },
          //       icon: const Icon(Icons.sentiment_satisfied),
          //       iconSize: size,
          //       color: Colors.blue,
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
