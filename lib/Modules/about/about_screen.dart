// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers

import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About_Screen extends StatelessWidget {
  const About_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward),
              color: fontColor,
            ),
          ],
          centerTitle: true,
          title: const Text(
            'عنا',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: fontColor,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Socity',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Color(0xffA8C8FF),
                      ),
                ),
                Text(
                  'Auti',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Color(0xffDBBCE1),
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/us.png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'مجتمع التوحد',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: fontColor),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'هو مشروع تخرج طلاب الفرقة الرابعة في كلية',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: fontColor),
                ),
                Text(
                  'الحاسبات و المعلومات جامعة دمنهور',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: fontColor),
                ),
                Text(
                  'بالنوبارية',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: fontColor),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff43474E),
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'إدارة و إشراف',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: mainColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'أ.د نورا شعيب',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: fontColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'أعضاء المشروع',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: mainColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
