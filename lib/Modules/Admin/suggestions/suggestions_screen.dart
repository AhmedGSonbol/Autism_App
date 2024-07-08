// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Suggestions_Screen extends StatelessWidget {
  const Suggestions_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    AppColors colors = AppColors(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward),
              color: const Color(0xffE1E2E9),
            )
          ],
          centerTitle: true,
          title: const Text(
            'الإقتراحات',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xffE1E2E9),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'أكثر جانب في حاجة للتطوير',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: colors.fontColor(), fontWeight: FontWeight.bold),
              ),
              Text(
                'وفقاً ﻹقتراحات اﻵخرين',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: colors.fontColor()),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(color: mainColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'الذكاء اﻹصطناعي',
                          style: TextStyle(color: colors.fontColor(), fontSize: 20),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffBDC7DC),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'التصميم',
                            style: TextStyle(color: colors.fontColor(), fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 30,
                            decoration: BoxDecoration(color: Color(0xffDBBCE1)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'اﻷداء',
                            style: TextStyle(color: colors.fontColor(), fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/images/suggest1.png')
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'المشاركون في اﻹقتراحات',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: colors.fontColor(), fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/suggest1.png'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '178',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: colors.fontColor(), fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('أب و أم',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: colors.fontColor())),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/suggest3.png'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '45',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: colors.fontColor(), fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('أب و أم',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: colors.fontColor())),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
