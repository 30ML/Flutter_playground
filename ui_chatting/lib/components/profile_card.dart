import 'package:flutter/material.dart';
import 'package:ui_chatting/models/user.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(user.backgroundImage),
        ),
        title: Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          user.intro,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
