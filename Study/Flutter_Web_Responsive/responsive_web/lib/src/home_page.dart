import 'package:flutter/material.dart';
import 'package:responsive_web/src/components/navigation_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          NavigationMenu(),
          Expanded(child: _content()),
          _footer(),
        ]),
      ),
    );
  }

  Widget _header() {
    return Placeholder(fallbackHeight: 80);
  }

  Widget _content() {
    return Placeholder();
  }

  Widget _footer() {
    return Placeholder(fallbackHeight: 40);
  }
}
