import 'package:flutter/material.dart';
import 'package:web_ui_rooms_reservation/size.dart';
import 'package:web_ui_rooms_reservation/components/home/home_body_banner.dart';
import 'package:web_ui_rooms_reservation/components/home/home_body_popular.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyWidth = getBodyWidth(context);

    return Center(
      child: SizedBox(
        width: bodyWidth,
        child: Column(
          children: [
            HomeBodyBanner(),
            HomeBodyPopular(),
          ],
        ),
      ),
    );
  }
}
