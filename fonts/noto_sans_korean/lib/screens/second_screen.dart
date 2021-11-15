import 'package:flutter/material.dart';
import 'package:noto_sans_korean/theme.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google_Font Package Font')),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Text Example', style: googleTextTheme().headline1),
                Container(
                  decoration: BoxDecoration(color: Colors.grey[350]),
                  child:
                      Text('Text Example', style: googleTextTheme().headline1),
                ),
              ],
            ),
            Text('Text Example', style: TextStyle(fontSize: 8)),
            Text('Text Example', style: TextStyle(fontSize: 14)),
            Text('Text Example', style: TextStyle(fontSize: 20)),
            Text('Text Example', style: TextStyle(fontSize: 26)),
            Text('Text Example', style: TextStyle(fontSize: 32)),
            Text('Text Example', style: TextStyle(fontSize: 38)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Text Example', style: TextStyle(fontSize: 20)),
                Container(
                  decoration: BoxDecoration(color: Colors.grey[350]),
                  child: Text('Text Example', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Text Example', style: TextStyle(fontSize: 20)),
                Container(
                  decoration: BoxDecoration(color: Colors.yellow[50]),
                  child: Text('Text Example', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Text('Text Example', style: TextStyle(fontSize: 44)),
            Text('Text Example', style: TextStyle(fontSize: 50)),
            Text('Text Example', style: TextStyle(fontSize: 56)),
          ],
        ),
      ),
    );
  }
}
