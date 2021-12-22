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
        title: const Text('Video PIP Test'),
        centerTitle: true,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(currentIndex: ,items: [],),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SizedBox(
        height: 54,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Icon(Icons.home),
              )
            )
          ],
          showUnselectedLabels: true,
          showSelectedLabels: true,

        ),
      ),
    ));
  }
}
