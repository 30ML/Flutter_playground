import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_chatting/components/my_chat.dart';
import 'package:ui_chatting/components/other_chat.dart';
import 'package:ui_chatting/components/time_line.dart';
import 'package:ui_chatting/components/chat_icon_button.dart';

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
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller:
                            _textController, // 다른 곳에서 TextField 에 접근할 수 있음
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onSubmitted:
                            _handleSubmitted, // 텍스트 입력 후 완료 버튼을 눌렀을 때 일어나는 이벤트
                      ),
                    ),
                  ),
                  ChatIconButton(icon: Icon(FontAwesomeIcons.smile)),
                  ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear(); // 전송(완료) 버튼 클릭 시 기존 입력됐던 텍스트 제거

    setState(() {
      chats.add(
        MyChat(
          text: text,
          time: DateFormat('a K:m')
              .format(new DateTime.now())
              .replaceAll('AM', '오전')
              .replaceAll('PM', '오후'),
        ),
      );
    });
  }
}
