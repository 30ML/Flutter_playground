import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/components/custom_elevated_button.dart';
import 'package:getx/components/custom_text_form_field.dart';
import 'package:getx/pages/post/home_page.dart';

class LoginPage extends StatelessWidget {
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
                '로그인 페이지',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Username',
            funcValidator: (value) {},
          ),
          CustomTextFormField(
            hint: 'Password',
            funcValidator: (value) {},
          ),
          CustomElevatedButton(
              text: '로그인', funcPageRoute: () => Get.to(HomePage())),
        ],
      ),
    );
  }
}
