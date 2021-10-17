import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  _HttpApp createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
        child: Center(
          child: Text('$_result'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = 'http://www.google.com';
          var response = await http.get(Uri.parse(url));

          setState(() {
            _result = response.body;
          });
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
}
