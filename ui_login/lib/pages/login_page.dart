import 'package:flutter/material.dart';
import 'package:ui_login/components/logo.dart';
import 'package:ui_login/size.dart';
import 'package:ui_login/components/custom_form.dart';

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
