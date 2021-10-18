import 'package:flutter/material.dart';

import '../animalItem.dart';

class FirstPage extends StatelessWidget {
  final List<Animal>? list;
  FirstPage({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('첫 번째 페이지'),
      ),
    );
  }
}
