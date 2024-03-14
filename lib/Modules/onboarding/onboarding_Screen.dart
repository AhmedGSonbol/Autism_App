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


class onBoardingModel{
  final String image;
  final String title;
  final String description;

  onBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingScreen extends StatefulWidget
{
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  bool isLast = false;

  final _pageController = PageController();

  List<onBoardingModel> screens =
  [
    onBoardingModel(
      image: 'assets/images/Exams-rafiki 1.png',
      title: 'تشخيص',
      description: 'تشخيص مبدائي مبني على الذكاء اﻷصطناعي لقياس مدى قابلية طفلك للإصابة بطيف التوحد',
    ),
    onBoardingModel(
      image: 'assets/images/Online Doctor-rafiki 1.png',
      title: 'محادثات',
      description: 'محادثات بين الطبيب المختص و ولي أمر طفل التوحد',
    ),
    onBoardingModel(
      image: 'assets/images/Messages-pana 1.png',
      title: 'مجتمع',
      description: 'مجتمع مخصص للأطباء و مجتمع للأباء و اﻷمهات و اﻷطباء',
    ),

  ];

  @override
  Widget build(BuildContext context)
  {


    return Scaffold(
      backgroundColor: onBoardingBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              SmoothPageIndicator(
                controller: _pageController,
                count: screens.length,
                effect: ExpandingDotsEffect(
                    dotWidth: 20,
                    dotHeight: 5,
                    activeDotColor: mainColor
                ),
              ),

              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context , index) => buildOnBoardintItem(context, screens[index]),
                  itemCount: screens.length,
                  onPageChanged: (index)
                  {
                    if(index == screens.length-1)
                    {
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
                  child: Text('التالي',style: TextStyle(color: mainColor),),
                  onPressed: ()
                  {
                    if(isLast == false)
                    {
                      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                    }else
                    {

                      CachHelper.saveData(key: 'ShowBoarding', value: false).then( (value)
                      {
                        if(value!)
                        {
                          navAndFinishTo(context, Login_Screen());
                        }
                      });
                    }

                  },
                ),
              ),

              const SizedBox(height: 30),

            ],),
        ),
      ),
    );
  }


  Widget buildOnBoardintItem(BuildContext context,onBoardingModel model)
  {
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
          style: TextStyles.onBoardingTitle,
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          model.description,
          style: TextStyles.onBoardingDesc,
        ),


      ],
    );
  }
}









