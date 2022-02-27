import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_example/memo.dart';
import 'package:flutter/material.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({Key? key}) : super(key: key);

  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  final String _databaseURL = '### REALTIME DATABASE DATABASE URL ###';
  List<Memo> memos = List.empty(growable: true);

  @override
  void initState() {
    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database!.reference().child('memo');

    reference!.onChildAdded.listen((event) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
