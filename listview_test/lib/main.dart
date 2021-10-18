import 'package:flutter/material.dart';

import 'screens/firstPage.dart';
import 'screens/secondPage.dart';
import 'animalItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listview Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(
        animalName: '벌', kind: '곤충', imagePath: 'assets/images/bee.png'));
    animalList.add(Animal(
        animalName: '고양이', kind: '포유류', imagePath: 'assets/images/cat.png'));
    animalList.add(Animal(
        animalName: '젖소', kind: '포유류', imagePath: 'assets/images/cow.png'));
    animalList.add(Animal(
        animalName: '강아지', kind: '포유류', imagePath: 'assets/images/dog.png'));
    animalList.add(Animal(
        animalName: '여우', kind: '포유류', imagePath: 'assets/images/fox.png'));
    animalList.add(Animal(
        animalName: '원숭이', kind: '포유류', imagePath: 'assets/images/monkey.png'));
    animalList.add(Animal(
        animalName: '돼지', kind: '포유류', imagePath: 'assets/images/pig.png'));
    animalList.add(Animal(
        animalName: '늑대', kind: '포유류', imagePath: 'assets/images/wolf.png'));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Test'),
      ),
      body: TabBarView(
        children: [
          FirstPage(),
          SecondPage(),
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue)),
        ],
        controller: controller,
      ),
    );
  }
}
