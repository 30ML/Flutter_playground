import 'package:flutter/material.dart';
import 'package:ui_login/size.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  const CustomTextFormField(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(height: small_gap),
        TextFormField(
          validator: (value) =>
              value!.isEmpty ? 'Please enter some text.' : null,
          // TextFormField가 Password 일 경우 '****'로 표시
          obscureText: text == 'Password' ? true : false,
          decoration: InputDecoration(
              hintText: 'Enter $text',
              // 기본
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // 터치 시
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // 에러 발생 시
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // 에러 발생 후, 터치 시
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ),
      ],
    );
  }
}
