import 'package:flutter/material.dart';

import 'package:used_market/theme.dart';
import 'package:used_market/screens/main_screens.dart';

void main() => runApp(UsedMarketUI());

class UsedMarketUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'used_Market_ui',
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
      theme: theme(),
    );
  }
}
