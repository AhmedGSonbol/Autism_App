// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace


import 'package:autism/Shared/components/components.dart';
import 'package:flutter/material.dart';

class TestResult extends StatelessWidget {
  const TestResult({super.key});

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
          'نتيجة التشخيص',
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
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/test_result.png'),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' عالي',
                      style: TextStyle(
                          color: Color(0xffFFB4AB),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' إحتمال الإصابة',
                      style: TextStyle(
                          color: Color(0xffE3E2E6),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
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
                  onPressed: () {},
                  text: 'إلغاء',
                  color: Color(0xffDBBCE1),
                  textColor: Color(0xff3E2845),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              defaultElevatedButton(
                onPressed: () {},
                text: 'حفظ',
                color: Color(0xffA8C8FF),
                textColor: Color(0xff05305F),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
