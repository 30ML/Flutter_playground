import 'package:flutter/material.dart';
import 'http_helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String result = '';
  late HttpHelper helper;

  @override
  void initState() {
    helper = HttpHelper();
    // HttpHelper().getUpcoming().then((value) {
    //   setState(() {
    //     result = value;
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    helper.getUpcoming().then((value) {
      setState(() {
        result = value;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Center(
        child: Text(result),
      ),
    );
  }
}
