import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/components/custom_elevated_button.dart';
import 'package:getx/components/custom_text_form_field.dart';
import 'package:getx/pages/user/login_page.dart';

class JoinPage extends StatelessWidget {
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
              child: Text(
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
      child: Column(
        children: [
          CustomTextFormField(hint: 'Username'),
          CustomTextFormField(hint: 'Password'),
          CustomTextFormField(hint: 'Email'),
          CustomElevatedButton(
              text: '회원 가입', pageRoute: () => Get.to(LoginPage())),
        ],
      ),
    );
  }
}
