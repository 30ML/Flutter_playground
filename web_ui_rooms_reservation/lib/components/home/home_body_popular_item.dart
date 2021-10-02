import 'package:flutter/material.dart';
import 'package:web_ui_rooms_reservation/size.dart';

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
              _buildPopularItemStar(),
              _buildPopularItemComment(),
              _buildPopularItemUserInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularItemImage() {
    return SizedBox();
  }

  Widget _buildPopularItemStar() {
    return SizedBox();
  }

  Widget _buildPopularItemComment() {
    return SizedBox();
  }

  Widget _buildPopularItemUserInfo() {
    return SizedBox();
  }
}
