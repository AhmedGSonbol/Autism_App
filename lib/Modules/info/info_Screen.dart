// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Info_Screen extends StatelessWidget {
  const Info_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/gettyimages-1379263404-612x612 1.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Text(
              'ما يجب معرفته عن مرض التوحد عند الأطفال ؟',
              style: TextStyle(
                  color: Color(0xffE3E2E6),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Questions-bro 1.png',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
