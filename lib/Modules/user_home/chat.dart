// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          child: ListView.separated(
            itemBuilder: ((context, index) => buildChatItems()),
            separatorBuilder: ((context, index) => SizedBox(
                  height: 10,
                )),
            itemCount: 10,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff254777),
          onPressed: () {},
          child: IconButton(
            icon: Icon(
              Icons.chat,
              color: Color(0xffD5E3FF),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
