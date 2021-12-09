import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.visibility),
          label: Text('Show Floating Widget'),
          onPressed: showOverlay,
        ),
      ),
      // bottomNavigationBar: buildNavigationBar(),
    );
  }

  void showOverlay() {
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: 20,
        top: 40,
        child: ElevatedButton.icon(
          icon: Icon(Icons.stop_circle_rounded),
          label: Text('Record'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent),
          ),
          onPressed: () {},
        ),
      ),
    );

    final overlay = Overlay.of(context);

    overlay!.insert(entry!);
  }
}
