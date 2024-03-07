// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:autism/Modules/user_home/drawer_slide/testing/test1.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:flutter/material.dart';

class TestSplash extends StatelessWidget {
  const TestSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d2024),
      appBar: AppBar(
        backgroundColor: Color(0xff1d2024),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xffE1E2E9),
        ),
        title: Text(
          'التشخيص',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Color(0xffE1E2E9),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/test1.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                child: Column(
                  children: [
                    Text(
                      ' تشخيص أولي مبني على الذكاء  اﻹصطناعي لقياس مدى قابلية طفلك للأصابة بالتوحد و من ',
                      style: TextStyle(
                          color: Color(0xffE1E2E9),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '  ثم اتخذ القرار المناسب',
                      style: TextStyle(
                          color: Color(0xffE1E2E9),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Divider(
            thickness: .5,
            color: Colors.grey,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: defaultElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return TestScreen1();
                      }),
                    );
                  },
                  text: 'التالي',
                  color: Color(0xffA8C8FF),
                  textColor: Color(0xff05305F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
