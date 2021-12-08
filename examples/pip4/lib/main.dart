import 'package:easy_pip/easy_pip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('PIP TEST'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_backup_restore),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyWidget()));
            },
          ),
        ],
      ),
      body: Center(
        child: Text('안녕하세요'),
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
      child: SizedBox(
        height: 200,
        child: YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isPipEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PIP TEST2')),
      body: PIPStack(
        pipEnabled: isPipEnabled,
        onClosed: () {
          isPipEnabled = !isPipEnabled;
          setState(() {});
        },
        backgroundWidget: Center(
          child: MaterialButton(
            child: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              setState(() {
                isPipEnabled = !isPipEnabled;
              });
            },
          ),
        ),
        pipWidget: isPipEnabled ? MyScreen() : Container(),
        pipExpandedContent: Card(
          color: Colors.white,
          child: Column(
            children: [
              Text('Hello World'),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget backGround() {
//   return Center(
//     child: MaterialButton(
//       child: Icon(CupertinoIcons.chevron_back),
//       onPressed: () {
//         setState(() {});
//       },
//     ),
//   );
// }
