import 'package:flutter/material.dart';
import 'package:web_ui_rooms_reservation/constants.dart';
import 'package:web_ui_rooms_reservation/size.dart';
import 'package:web_ui_rooms_reservation/styles.dart';

class HomeBodyPopularItem extends StatelessWidget {
  final id;
  final popularList = [
    'p1.jpeg',
    'p2.jpeg',
    'p3.jpeg',
  ];
  HomeBodyPopularItem({required this.id});

  @override
  Widget build(BuildContext context) {
    // popular item은 전체화면 70%의 1/3 의 -5 의 크기를 가짐
    double popularItemWidth = getBodyWidth(context) / 3 - 5;

    return Padding(
      padding: const EdgeInsets.only(bottom: gap_xl),
      child: Container(
        // 화면 축소 시 최소 제약 조건
        constraints: BoxConstraints(
          minWidth: 320,
        ),
        child: SizedBox(
          width: popularItemWidth,
          child: Column(
            children: [
              _buildPopularItemImage(),
              SizedBox(height: gap_s),
              _buildPopularItemStar(),
              SizedBox(height: gap_s),
              _buildPopularItemComment(),
              SizedBox(height: gap_s),
              _buildPopularItemUserInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularItemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset('assets/${popularList[id]}', fit: BoxFit.cover),
    );
  }

  Widget _buildPopularItemStar() {
    return Row(
      children: [
        Icon(Icons.star, color: kAccentColor),
        Icon(Icons.star, color: kAccentColor),
        Icon(Icons.star, color: kAccentColor),
        Icon(Icons.star, color: kAccentColor),
        Icon(Icons.star, color: kAccentColor),
      ],
    );
  }

  Widget _buildPopularItemComment() {
    return Text(
      '깔끔하고 다 갖춰져있어서 좋았어요:) 위치도 완전 좋아용 다들 여기 살고싶다구ㅋㅋㅋㅋㅋ 화장실도 3개에요!!! 5명이서 씻는것도 전혀 불편함없이 좋았어요^^ 이불도 포근하고 좋습니당ㅎㅎ',
      style: body1(),
      maxLines: 3, // 글자 라인 수을 제한
      overflow: TextOverflow.ellipsis, // 글자가 라인을 벗언나면 ... 처리
    );
  }

  Widget _buildPopularItemUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/p1.jpeg'),
        ),
        SizedBox(width: gap_s),
        Column(
          children: [
            Text(
              '데어',
              style: subtitle1(),
            ),
            Text('한국'),
          ],
        ),
      ],
    );
  }
}
