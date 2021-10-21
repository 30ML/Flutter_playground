import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget {
  @override
  _LargeFileMainState createState() => _LargeFileMainState();
}

class _LargeFileMainState extends State<LargeFileMain> {
  final imgUrl =
      'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg?auto=compress'; // 내려받을 이미지 주소
  bool downloading = false; // 지금 내려받는 중인지 확인하는 변수
  String progressString = ''; // 현재 얼마나 내려받았는지 표시하는 변수
  String file = ''; // 내려받은 파일

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir =
          await getApplicationDocumentsDirectory(); // 내부 디럭터리 가져오기 (path_provider)
      file = '${dir.path}/myimage.jpg';

      await dio.download(imgUrl, file, onReceiveProgress: (rec, total) {
        print('Rec: $rec, Total: $total');

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + '%';
        });
      });
    } catch (error) {
      print(error);
    }
    setState(() {
      downloading = false;
      progressString = 'Completed';
    });
    print('Download Completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Large File Download Example'),
      ),
      body: Center(
        child: downloading
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 20.0),
                      Text(
                        'Downloading File: $progressString',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            : FutureBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      print('none');
                      return const Text('데이터 없음');
                    case ConnectionState.waiting:
                      print('waiting');
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                      print('active');
                      return const CircularProgressIndicator();
                    case ConnectionState.done:
                      print('done');
                      if (snapshot.hasData) {
                        return snapshot.data as Widget;
                      }
                  }
                  print('end process');
                  return const Text('데이터 없음');
                },
                future: downloadWidget(file),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.file_download),
        onPressed: () {
          downloadFile();
        },
      ),
    );
  }
}
