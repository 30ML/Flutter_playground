import 'package:flutter/material.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Provider', style: TextStyle(fontSize: 20)),
          Text('0', style: TextStyle(fontSize: 50)),
          ElevatedButton(
            onPressed: () {},
            child: Text('+', style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
