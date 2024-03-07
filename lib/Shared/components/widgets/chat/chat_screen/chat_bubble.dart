// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //Don`nt use fixed height and width
        // height: 85,
        // width: 150,
        padding:
            EdgeInsetsDirectional.only(start: 16, bottom: 16, end: 16, top: 16),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xffA8C8FF),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
            bottomStart: Radius.circular(40),
          ),
        ),
        child: Text(
          'السلام عليكم ورحمة الله',
          style: TextStyle(
            color: Color(0xff05305F),
          ),
        ),
      ),
    );
  }
}
