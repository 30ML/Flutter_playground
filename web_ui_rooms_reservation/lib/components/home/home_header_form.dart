import 'package:flutter/material.dart';
import 'package:web_ui_rooms_reservation/constants.dart';
import 'package:web_ui_rooms_reservation/size.dart';
import 'package:web_ui_rooms_reservation/styles.dart';
import 'package:web_ui_rooms_reservation/components/common/common_form_field.dart';

class HomeHeaderForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Align(
        // -1.0 부터 1.0까지 가로 범위에서 0.1의 값은 5%
        // alignment: Alignment(-0.6, 0),
        alignment: screenWidth < 520 ? Alignment(0, 0) : Alignment(-0.6, 0),
        child: Container(
          width: 420,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(gap_l),
              child: Column(
                children: [
                  _buildFormTitle(),
                  SizedBox(height: gap_m),
                  _buildFormField(),
                  SizedBox(height: gap_m),
                  _buildFormSubmit(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormTitle() {
    return Column(
      children: [
        Text('모두의숙소에서 숙소를 검색하세요', style: h4()),
        SizedBox(height: gap_xs),
        Text(
          '혼자하는 여행에 적합한 개인실부터 여럿이 함께하는 여행에 좋은 \'공간전체\' 숙소까지, 모두의숙소에 다 있습니다.',
          style: body1(),
        ),
      ],
    );
  }

  Widget _buildFormField() {
    return Column(
      children: [
        CommonFormField(
          prefixText: '위치',
          hintText: '근처 추천 장소',
        ),
        SizedBox(height: gap_s),
        Row(
          children: [
            Expanded(
              child: CommonFormField(
                prefixText: '체크인',
                hintText: '날짜 입력',
              ),
            ),
            SizedBox(width: gap_s),
            Expanded(
              child: CommonFormField(
                prefixText: '체크아웃',
                hintText: '날짜 입력',
              ),
            ),
          ],
        ),
        SizedBox(height: gap_s),
        Row(
          children: [
            Expanded(
              child: CommonFormField(
                prefixText: '성인',
                hintText: '2',
              ),
            ),
            SizedBox(width: gap_s),
            Expanded(
              child: CommonFormField(
                prefixText: '어린이',
                hintText: '0',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormSubmit() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          print('Submit Clicked!!');
        },
        child: Text(
          '검색',
          style: subtitle1(mColor: Colors.white),
        ),
      ),
    );
  }
}
