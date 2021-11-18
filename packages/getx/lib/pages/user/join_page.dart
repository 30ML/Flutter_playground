import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/components/custom_elevated_button.dart';
import 'package:getx/components/custom_text_form_field.dart';
import 'package:getx/pages/user/login_page.dart';
import 'package:validators/validators.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 300,
              alignment: Alignment.center,
              child: const Text(
                '회원 가입 페이지',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formKey, // key로 (외부에서도) form 내부를 컨트롤할 수 있음
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Username',
            funcValidator: (String value) {
              if (!isAlphanumeric(value)) {
                return '유저 네임에 한글이 들어갈 수 없습니다.';
              } else if (value.isEmpty) {
                return '공백이 들어갈 수 없습니다.';
              } else if (value.length > 12) {
                return '유저네임의 길이를 초과하였습니다.';
              } else {
                return null;
              }
            },
          ),
          CustomTextFormField(
            hint: 'Password',
            funcValidator: (value) {},
          ),
          CustomTextFormField(
            hint: 'Email',
            funcValidator: (value) {
              if (!isEmail(value)) {
                return '정확한 이메일을 입력해주세요';
              } else {
                return null;
              }
            },
          ),
          CustomElevatedButton(
              text: '회원가입',
              funcPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(LoginPage());
                }
              }),
        ],
      ),
    );
  }
}
