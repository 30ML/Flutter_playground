import 'package:flutter/material.dart';
import 'package:flutter_ex_profile/theme.dart';
import 'package:flutter_ex_profile/components/profile_drawer.dart';
import 'package:flutter_ex_profile/components/profile_header.dart';
import 'package:flutter_ex_profile/components/profile_count_info.dart';
import 'package:flutter_ex_profile/components/profile_buttons.dart';
import 'package:flutter_ex_profile/components/profile_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: ProfileDrawer(),
        appBar: _buildProfileAppBar(),
        body: Column(
          children: [
            SizedBox(height: 20),
            ProfileHeader(),
            SizedBox(height: 20),
            ProfileCountInfo(),
            SizedBox(height: 20),
            ProfileButtons(),
            Expanded(child: ProfileTab()),
            // 남아 있는 공간을 모두 차지하기 위해 Expanded 위젯 사용
          ],
        ));
  }

  AppBar _buildProfileAppBar() {
    return AppBar(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text('Profile'),
      centerTitle: true,
    );
  }
}
