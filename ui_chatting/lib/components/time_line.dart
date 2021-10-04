import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  final String time;

  const TimeLine({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Color(0xFF9cafbe),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        time,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
