// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unnecessary_import

import 'package:autism/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Manage_Admins_Screen extends StatelessWidget {
  const Manage_Admins_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myNavBar(
          selectedIndex: 0,
          text: ['مستخدم', 'مسؤول'],
          onDestinationSelected: (index) {},
        ),
        ListView.separated(
          itemBuilder: ((context, index) => buildChatItems(context)),
          separatorBuilder: ((context, index) => SizedBox(
                height: 10,
              )),
          itemCount: 10,
        ),
      ],
    );
  }

  Widget buildChatItems(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff292A2D),
            borderRadius: BorderRadiusDirectional.circular(30),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/Rectangle (1).png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'د. أحمد',
                    style: onBoardingDesc,
                  ),
                  Spacer(),
                  const Text(
                    'Oct 8 2024',
                    style: TextStyle(color: Color(0xffE1E2E9), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التخصص :  أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ ',
                    style: TextStyle(color: fontColor, fontSize: 20),
                  ),
                  Text(
                    'فتح ملف تعريف الهوية',
                    style: TextStyle(color: Color(0xffA8C8FF), fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  defaultElevatedButton(
                    text: 'قبول',
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  defaultElevatedButton(
                    text: 'رفض',
                    color: secondColor,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
