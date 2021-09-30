import 'package:flutter/material.dart';
import 'package:flutter_ui_login/components/logo.dart';
import 'package:flutter_ui_login/size.dart';
import 'package:flutter_ui_login/components/custom_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo('Login'),
            SizedBox(height: large_gap),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
