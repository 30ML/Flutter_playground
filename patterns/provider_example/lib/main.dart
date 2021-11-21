import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/home.dart';
import 'package:provider_example/src/count_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyApp Widget build!!!');

    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /* Multi Provider:  */
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => CountProvider(),
          ),
        ],
        child: Home(),
      ),
      /* Single Provider */
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) => CountProvider(),
      //   child: Home(),
      // ),
    );
  }
}
