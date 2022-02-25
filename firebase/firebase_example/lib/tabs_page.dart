import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  final FirebaseAnalyticsObserver observer;

  const TabsPage(
    this.observer, {
    Key? key,
  }) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin, RouteAware {
  TabController? _controller;
  int selectedIndex = 0;

  final List<Tab> tabs = [
    const Tab(
      text: '1번',
      icon: Icon(Icons.looks_one),
    ),
    const Tab(
      text: '2번',
      icon: Icon(Icons.looks_two),
    ),
  ];

  @override
  void initState() {
    _controller = TabController(
      vsync: this,
      length: tabs.length,
      initialIndex: selectedIndex,
    );
    _controller!.addListener(() {
      setState(() {
        if (selectedIndex != _controller!.index) {
          selectedIndex = _controller!.index;
          _sendCurrentTab();
        }
      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    widget.observer
        .subscribe(this, ModalRoute.of(context) as dynamic); // Subscribe

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.observer.unsubscribe(this); // Unsubscribe

    super.dispose();
  }

  void _sendCurrentTab() {
    widget.observer.analytics
        .setCurrentScreen(screenName: 'tab/$selectedIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: tabs.map((Tab tab) {
          return Center(child: Text(tab.text!));
        }).toList(),
      ),
    );
  }
}
