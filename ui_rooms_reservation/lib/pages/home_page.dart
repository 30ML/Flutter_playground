import 'package:flutter/material.dart';
import 'package:web_ui_rooms_reservation/components/home/home_header.dart';
import 'package:web_ui_rooms_reservation/components/home/home_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeHeader(),
          HomeBody(),
        ],
      ),
    );
  }
}
