import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class FileApp extends StatefulWidget {
  @override
  _FileAppState createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {
  int _count = 0;
  List<String> itemList = List.empty(growable: true);
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    readCountFile();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File IO Example'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Text(
                        itemList[index],
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count++;
          });
          writeCountFile(_count);
        },
      ),
    );
  }

  void writeCountFile(int count) async {
    var dir = await getApplicationDocumentsDirectory();
    File(dir.path + '/count.txt').writeAsStringSync(count.toString());
  }

  void readCountFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var file = File(dir.path + '/count.txt').readAsStringSync();
      print(file);

      setState(() {
        _count = int.parse(file);
      });
    } catch (error) {
      print(error.toString());
    }
  }

  void initData() async {
    var result = await readListFile();
    setState(() {
      itemList.addAll(result);
    });
  }

  Future<List<String>> readListFile() async {
    List<String> itemList = List.empty(growable: true);
    String key = 'first';
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isReaded = pref.getBool(key); // 파일을 처음 열었는지 확인

    var dir = await getApplicationDocumentsDirectory();
    bool isFileExist = await File(dir.path + '/fruit.txt').exists();

    if (isReaded == null || isReaded == false || isFileExist == false) {
      pref.setBool(key, true);
      var file =
          await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');
      File(dir.path + '/fruit.txt').writeAsStringSync(file);
      var array = file.split('\n');

      for (var item in array) {
        print(item);
        itemList.add(item);
      }
    } else {
      var file = await File(dir.path + '/fruit.txt').readAsString();
      var array = file.split('\n');

      for (var item in array) {
        print(item);
        itemList.add(item);
      }
    }
    return itemList;
  }

  void writeFruit(String fruit) async {}
}
