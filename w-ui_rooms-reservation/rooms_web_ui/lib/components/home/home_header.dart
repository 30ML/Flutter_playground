import 'package:flutter/material.dart';
import 'package:rooms_web_ui/components/home/home_header_appbar.dart';
import 'package:rooms_web_ui/components/home/home_header_form.dart';
import 'package:rooms_web_ui/size.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: header_height,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
