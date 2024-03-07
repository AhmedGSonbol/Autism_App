// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:autism/Modules/user_home/drawer_slide/testing/test_result.dart';
import 'package:autism/Shared/Constants/testing/test.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestScreen15 extends StatelessWidget {
  const TestScreen15({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            child: Image.asset(TestCircles.circle15),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    TestImages.testImage15,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  TestTexts.text15,
                  style: TextStyle(
                      color: Color(0xffE1E2E9),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 300,
                        height: 50,
                        alignment: AlignmentDirectional.centerEnd,
                        padding: EdgeInsetsDirectional.only(end: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .5,
                            color: Color(0xff8E9199),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'العرق',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffCCCCCC)),
                        ),
                      ),
                      onTap: () {},
                    )
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      defaultElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'السابق',
                        color: Color(0xffDBBCE1),
                        textColor: Color(0xff3E2845),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      defaultElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return TestResult();
                            }),
                          );
                        },
                        text: 'التالي',
                        color: Color(0xffA8C8FF),
                        textColor: Color(0xff05305F),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// defaultElevatedButton(
//                 onPressed: () {},
//                 text: 'السابق',
//                 color: Color(0xffDBBCE1),
//                 textColor: Color(0xff3E2845),
//               ),