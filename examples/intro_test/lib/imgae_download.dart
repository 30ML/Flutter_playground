import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImageDownload extends StatefulWidget {
  @override
  _ImageDownloadState createState() => _ImageDownloadState();
}

class _ImageDownloadState extends State<ImageDownload> {
  final imgUrl =
      'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg?auto=compress';
  bool downloading = false; // 다운로드 진행 중 상태
  String progressRateString = '';
  String file = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Image Download Example'),
      ),
      body: Center(
        child: downloading
            ? SizedBox(
                height: 120,
                width: 200,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 20),
                      Text(
                        'Downloading Image: $progressRateString',
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
                      return const Text('No Data');
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
                  print('end processing');
                  return const Text('No Data');
                },
                future: downloadWidget(file),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.file_download),
        onPressed: () {
          downloadImage();
        },
      ),
    );
  }

  Future<Widget> downloadWidget(String filePath) async {
    File file = File(filePath);
    bool isFileExist = await file.exists();
    if (isFileExist) {
      return Center(
        child: Column(
          children: [Image.file(File(filePath))],
        ),
      );
    } else {
      return const Text('No Data');
    }
  }

  Future<void> downloadImage() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      file = dir.path + '/myImage.jpg';

      await dio.download(imgUrl, file, onReceiveProgress: (rec, total) {
        print('Rec: $rec, Total: $total');

        setState(() {
          downloading = true;
          progressRateString = ((rec / total) * 100).toStringAsFixed(0) + '%';
        });
      });
    } catch (err) {
      print(err);

      setState(() {
        downloading = false;
        progressRateString = 'Failed';
      });
    }

    setState(() {
      downloading = false;
      progressRateString = 'Completed';
    });
    print('Download Complete');
  }
}
