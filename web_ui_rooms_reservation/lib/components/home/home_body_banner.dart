import 'package:flutter/material.dart';
import 'package:web_ui_rooms_reservation/size.dart';
import 'package:web_ui_rooms_reservation/styles.dart';

class HomeBodyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Stack(
        children: [
          _buildBannerImage(),
          _buildBannerCaption(),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/banner.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 320,
      ),
    );
  }

  Widget _buildBannerCaption() {
    return Positioned(
      top: 40,
      left: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // 글자 범위 최대 제약 조건
            constraints: BoxConstraints(maxWidth: 250),
            child: Text(
              '이제, 여행은 가까운 곳에서',
              style: h4(mColor: Colors.white),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            child: Text(
              '새로운 공간에 머물러 보세요. 살아보기, 출장, 여행 등 다향한 목적에 맞는 숙소를 찾아보세요.',
              style: subtitle1(mColor: Colors.white),
            ),
          ),
          SizedBox(height: gap_m),
          SizedBox(
            height: 35,
            width: 170,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                print('Search Button Clicked!!');
              },
              child: Text(
                '가까운 여행지 둘러보기',
                style: subtitle2(),
              ),
            ),
          ),
        ],
      ),
    ); // Stack 위젯 내부에 위치 설정을 위해 Positioned 위젯 사용
  }
}
