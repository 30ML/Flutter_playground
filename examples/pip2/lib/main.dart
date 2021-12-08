import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PIP TEST')),
      body: ListView(
        children: [
          MyScreen(),
          background(1),
          background(2),
          background(3),
          background(4),
        ],
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'K18cpp_-gP8',
    params: YoutubePlayerParams(
      playlist: [
        'yD2tcE9407A',
      ], // Defining custom playlist
      // startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );
  var isPipOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          MaterialButton(
              child: Icon(CupertinoIcons.chevron_back),
              onPressed: () {
                PIPView.of(context)!.presentBelow(Home());
              }),
          SizedBox(
            height: 200,
            child: PIPView(
              floatingWidth: 176,
              floatingHeight: 99,
              builder: (context, isFloating) {
                return YoutubePlayerIFrame(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyBackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        var IndexedColor = (index + 1) * 100;
        return Container(
          child: Row(
            children: [
              Text('$index', style: TextStyle(fontSize: 20)),
              Expanded(
                child: Container(
                  height: 200,
                  width: 350,
                  padding: EdgeInsets.all(10),
                  color: Colors.red[IndexedColor],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget background(int index) {
  return Container(
    child: Row(
      children: [
        Text('$index', style: TextStyle(fontSize: 20)),
        Expanded(
          child: Container(
            height: 200,
            width: 350,
            padding: EdgeInsets.all(10),
            color: Colors.red[(index + 1) * 100],
          ),
        ),
      ],
    ),
  );
}
