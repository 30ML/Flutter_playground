import 'package:flutter/material.dart';
import 'package:market_ui/theme.dart';
import 'package:market_ui/screens/main_screens.dart';

void main() => runApp(UsedMarketUI());

class UsedMarketUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'used_matket_ui',
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
      theme: theme(),
    );
  }
}
