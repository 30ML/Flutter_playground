import 'package:flutter/material.dart';
import 'package:glassmorphism_button/glassmorphism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isBlur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Stack(
          children: [
            Image.network(
              'https://tinyurl.com/2p8zr2ze',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isBlur = !_isBlur;
                  });
                },
                child: GlassMorphism(
                  blur: _isBlur ? 20 : 0,
                  opacity: 0.5,
                  child: const SizedBox(
                    height: 210,
                    width: 320,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
