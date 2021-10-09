import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_chatting/components/my_chat.dart';
import 'package:ui_chatting/components/other_chat.dart';
import 'package:ui_chatting/components/time_line.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFb2c7da),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            '홍길동',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            Icon(FontAwesomeIcons.search, size: 20),
            SizedBox(width: 25),
            Icon(FontAwesomeIcons.bars, size: 20),
            SizedBox(width: 25),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TimeLine(time: '2021년 1월 1일 금요일'),
                      OtherChat(
                        name: '홍길동',
                        text: '새해 복 많이 받으세요.',
                        time: '오전 10:10',
                      ),
                      MyChat(
                        text: '선생님도 많이 받으세요.',
                        time: '오후 2:15',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
