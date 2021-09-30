import 'package:flutter/material.dart';
import 'package:flutter_ui_login/components/custom_text_form_field.dart';
import 'package:flutter_ui_login/size.dart';

class CustomForm extends StatelessWidget {
  // Global Key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      // Global key를 Form 위젯에 연결하여 해당 key로 Form의 상태를 관리
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField('Email'),
          SizedBox(height: medium_gap),
          CustomTextFormField('Password'),
          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              // 유효성 검사
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, '/home');
              }
            },
            child: Text('Login'),
          )
        ],
      ),
    );
  }
}
