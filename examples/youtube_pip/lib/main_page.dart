import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Page'),
        centerTitle: true,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(currentIndex: ,items: [],),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    
  }
}
