import 'package:flutter/material.dart';
import 'package:web_ui_rooms_reservation/size.dart';
import 'package:web_ui_rooms_reservation/components/home/home_body_popular_item.dart';

class HomeBodyPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPopularTitle(),
          _buildPopularList(),
        ],
      ),
    );
  }

  Widget _buildPopularTitle() {
    return SizedBox();
  }

  Widget _buildPopularList() {
    // 화면 전체 사이즈를 1000이라고 가정하고 이해
    // _buildPopularList 의 너비는 화면의 70%이므로 700임
    // HomeBodyPopularItem 의 너비는 700의 1/3인 233.33 - 5의 크기. 즉, 228.33임
    // 228.33의 popular item이 3개 배치되면 684.99 크기이고, 15.01이 남음
    // 결론적으로 HomBodyPopularItem 위젯 사이사이에 SizedBox 7.5를 줄 수 있음
    return Wrap(
      children: [
        HomeBodyPopularItem(id: 0),
        SizedBox(width: 7.5),
        HomeBodyPopularItem(id: 1),
        SizedBox(width: 7.5),
        HomeBodyPopularItem(id: 2),
      ],
    );
  }
}
