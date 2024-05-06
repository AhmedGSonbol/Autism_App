// ignore_for_file: prefer_const_constructors, unnecessary_import, deprecated_member_use

import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Our_Vision extends StatelessWidget {
  const Our_Vision({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
            'رؤيتنا',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: fontColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 30.0),
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مجتمع',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: mainColor, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'التوحد',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Color(0xffDBBCE1), fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/icon2.png'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'AutiSocity',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: fontColor, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/view.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'نطمح في مساعدة اﻷباء و اﻷمهات الذين لديهم أبناء مصابين بطيف التوحد في التعرف على المرض مبكراً و بالتالي إتخاذ اﻹجراءات اللازمة و أيضا توفير منصة كاملة تمكن كلاً من الطبيب و ولي أمر الطفل في التحدث معاً و أيضا مكان لنشر نصائح و معلومات و تنبيهات و آخيراً جزىء معرفي و تربوي للأباء و اﻷمهات.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: fontColor, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
