// ignore_for_file: file_names

import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/network/local/Cach_Helper.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:autism/modules/login/login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingModel {
  final String image;
  final String title;
  final String description;

  onBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  final _pageController = PageController();

  List<onBoardingModel> screens = [
    onBoardingModel(
      image: 'assets/images/Exams-rafiki 1.png',
      title: 'Diagnosis',
      description:
          'An initial diagnosis based on artificial intelligence to measure your child’s susceptibility to the autism spectrum',
    ),
    onBoardingModel(
      image: 'assets/images/Online Doctor-rafiki 1.png',
      title: 'Chats',
      description: 'Conversations between the specialist doctor and the parent of an autistic child',
    ),
    onBoardingModel(
      image: 'assets/images/Messages-pana 1.png',
      title: 'Society',
      description: 'A community dedicated to doctors and a community for parents and doctors',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: screens.length,
                effect: ExpandingDotsEffect(
                    dotWidth: 20, dotHeight: 5, activeDotColor: mainColor),
              ),
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) =>
                      buildOnBoardintItem(context, screens[index]),
                  itemCount: screens.length,
                  onPageChanged: (index) {
                    if (index == screens.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(


                  child: Text(
                    'Next',
                    style: TextStyle(color: mainColor),
                  ),
                  onPressed: () {
                    if (isLast == false) {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    } else
                    {

                      CachHelper.saveData(key: 'ShowBoarding', value: false)
                          .then((value) {
                        navAndFinishTo(context, Login_Screen());
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOnBoardintItem(BuildContext context, onBoardingModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          model.image,
          height: 300,
          width: 300,
        ),
        const SizedBox(height: 30),
        Text(
          model.title,
          style: TextStyle(
            color: Color(0xff1e1d16),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          model.description,
          style: TextStyle(
            color: Color(0xff1e1d16),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
