// ignore_for_file: prefer_const_constructors

import 'package:autism/Modules/Admin/manage_Admins/manage_Accounts_Screen.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class User_Accounts_Screen extends StatelessWidget {
  const User_Accounts_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 20.0),
      itemBuilder: (context, index) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: buildUserAccountsItem(context));
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10.0,
      ),
      itemCount: 10,
    );
  }
}

Widget buildUserAccountsItem(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff292A2D),
            borderRadius: BorderRadiusDirectional.circular(30),
            border: Border(
              top: BorderSide(
                color: Color(0xffA8C8FF),
                width: 5,
              ),
            )),
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
                    'assets/images/Rectangle (8).png',
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  'اﻹسم',
                  style: onBoardingDesc,
                ),
                Spacer(
                  flex: 2,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Color(0xff43474E),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'أحمد يس',
                    style: TextStyle(color: fontColor, fontSize: 20),
                  ),
                ),
                Spacer(
                  flex: 6,
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 80,
                ),
                Text(
                  'اﻹيميل',
                  style: onBoardingDesc,
                ),
                Spacer(),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Color(0xff43474E),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'username@gmail.com',
                    style: TextStyle(color: Color(0xffE1E2E9), fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Spacer(
                  flex: 6,
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defaultElevatedButton(
                  text: 'حذف',
                  color: secondColor,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
