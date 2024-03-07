import 'package:flutter/material.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({super.key});

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
          'الإعدادات',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Color(0xffE1E2E9),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 130,
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(top: 16),
              decoration: BoxDecoration(
                  color: Color(0xff282A2F),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffBDC7DC),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'اﻹشعارات',
                          style: TextStyle(
                              color: Color(0xff273141),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                            width: 70,
                            height: 40,
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                                color: Color(0xffA8C8FF),
                                borderRadius: BorderRadius.circular(70)),
                            child: Image.asset('assets/images/right.png')),
                        SizedBox(
                          width: 200,
                        ),
                        Text(
                          'اﻹشعارات',
                          style: TextStyle(
                              color: Color(0xffE1E2E9),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 370,
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(top: 16),
              decoration: BoxDecoration(
                  color: Color(0xff282A2F),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffF8D8FE),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'إمكانية اﻵخرين',
                          style: TextStyle(
                              color: Color(0xff3E2845),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 70,
                                height: 40,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Color(0xffA8C8FF),
                                    borderRadius: BorderRadius.circular(70)),
                                child: Image.asset('assets/images/right.png')),
                            SizedBox(
                              width: 200,
                            ),
                            Text(
                              'اﻹشعارات',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 70,
                                height: 40,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Color(0xffA8C8FF),
                                    borderRadius: BorderRadius.circular(70)),
                                child: Image.asset('assets/images/right.png')),
                            SizedBox(
                              width: 160,
                            ),
                            Text(
                              'رؤيتك في البحث',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 70,
                                height: 40,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Color(0xffA8C8FF),
                                    borderRadius: BorderRadius.circular(70)),
                                child: Image.asset('assets/images/right.png')),
                            SizedBox(
                              width: 190,
                            ),
                            Text(
                              'التحدث معك',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 70,
                                height: 40,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Color(0xffA8C8FF),
                                    borderRadius: BorderRadius.circular(70)),
                                child: Image.asset('assets/images/right.png')),
                            SizedBox(
                              width: 140,
                            ),
                            Text(
                              'التعليق على منشورك',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 70,
                                height: 40,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Color(0xffA8C8FF),
                                    borderRadius: BorderRadius.circular(70)),
                                child: Image.asset('assets/images/right.png')),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'التطبيق استخدام بيانات التشخيص',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 10),
              child: Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(top: 16),
                decoration: BoxDecoration(
                    color: Color(0xff282A2F),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffBDC7DC),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'النسخة اﻹحتياطية',
                            style: TextStyle(
                                color: Color(0xff273141),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xffA8C8FF),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: Color(0xff05305F),
                                  ),
                                  Text(
                                    'نسخ',
                                    style: TextStyle(
                                        color: Color(0xff05305F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'عمل نسخة للمحادثات و اﻹعدادات',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xffA8C8FF),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.upload,
                                    color: Color(0xff05305F),
                                  ),
                                  Text(
                                    'إسترداد',
                                    style: TextStyle(
                                        color: Color(0xff05305F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              'إسترداد النسخة اﻹحتياطية',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
