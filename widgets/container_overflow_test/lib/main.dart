import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Overflow Test',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Overflow Test'),
      ),
      body: Center(
        child: Container(
          height: 20,
          color: Colors.grey,
          // child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       var indexedColor = (index + 1) * 100;

          //       return Container(
          //         color: Colors.red[indexedColor],
          //         child: Text('index index index $index'),
          //       );
          //     })

          // child: LayoutBuilder(builder: (context, constraints) {
          //   if (constraints.maxHeight > 200.0) {
          //     return new Text('BIG');
          //   } else {
          //     return new Text('SMALL');
          //   }
          // }),

          // child: Wrap(
          //   children: List.generate(
          //     4,
          //     (index) {
          //       var indexedColor = (index + 1) * 100;

          //       return LayoutBuilder(builder: (context, constraints) {
          //         if (constraints.maxHeight > 50) {
          //           return Container(child: Text('100'));
          //         } else {
          //           return Container(
          //             color: Colors.red[indexedColor],
          //             child: Text('index index index $index'),
          //           );
          //         }
          //       });
          //     },
          //   ),
          // ),

          child: LayoutBuilder(builder: (context, constraints) {
            print('constraints >> ${constraints}');
            return Wrap(
              children: List.generate(4, (index) {
                var indexedColor = (index + 1) * 100;

                return constraints.maxHeight >= 20
                    ? Container(
                        color: Colors.red[indexedColor],
                        child: Text('index index $index',
                            style: TextStyle(fontSize: 60 / 4)),
                      )
                    : Container();
              }),
            );
          }),

          // child: ListView.builder(
          //   scrollDirection: Axis.horizontal,

          //   // shrinkWrap: true,
          //   itemCount: 4,
          //   itemBuilder: (context, index) {
          //     var indexedColor = (index + 1) * 100;
          //     return Container(
          //       color: Colors.red[indexedColor],
          //       child: Text('index index index $index'),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
