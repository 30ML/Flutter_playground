import 'package:flutter/material.dart';
import 'package:provider_movie_app/src/provider/counter_provider.dart';
import 'package:provider_movie_app/src/ui/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => CounterProvider())
        ],
        child: Home(),
      ),
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) => CounterProvider(),
      //   child: Home(),
      // ),
    );
  }
}
