// ignore_for_file: prefer_const_constructors

import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          child: ListView.separated(
            itemBuilder: (context, index) => buildReviewsItem(),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: 20,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff254777),
          onPressed: () {},
          child: Icon(
            Icons.arrow_upward,
            color: Color(0xffD5E3FF),
          ),
        ),
      ),
    );
  }
}
