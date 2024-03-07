import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/network/local/Cach_Helper.dart';
import 'package:autism/modules/login/login_Screen.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
{
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      _currentPageIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingPage(
                image: 'assets/images/Exams-rafiki 1.png',
                title: Text(
                  'تشخيص',
                  style: textOnBoarding,
                ),
                description: Column(
                  children: [
                    Text(
                      'تشخيص مبدائي مبني على الذكاء اﻷصطناعي لقياس مدى قابلية',
                      style: textOnBoarding2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'طفلك للإصابة بطيف التوحد',
                      style: textOnBoarding2,
                    )
                  ],
                ),
              ),
              OnboardingPage(
                image: 'assets/images/Online Doctor-rafiki 1.png',
                title: Text(
                  'محادثات',
                  style: textOnBoarding,
                ),
                description: Text(
                    'محادثات بين الطبيب المختص و ولي أمر طفل التوحد',
                    style: textOnBoarding2),
              ),
              OnboardingPage(
                image: 'assets/images/Messages-pana 1.png',
                title: Text(
                  'مجتمع',
                  style: textOnBoarding,
                ),
                description: Text(
                  'مجتمع مخصص للأطباء و مجتمع للأباء و اﻷمهات و اﻷطباء',
                  style: textOnBoarding2,
                ),
                isLastPage: true,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Positioned(
                top: 20.0,
                right: 20.0,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: _currentPageIndex == index ? 60.0 : 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: _currentPageIndex == index
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final Widget title;
  final Widget description;
  final bool isLastPage;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300,
            width: 300,
          ),
          const SizedBox(height: 30),

          title,
          const SizedBox(height: 10),
          description,
          // Text(
          //   title,
          //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(height: 10),
          // Text(
          //   description,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(fontSize: 16),
          // ),
          const SizedBox(height: 30),
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                // Handle button press for last page

                CachHelper.saveData(key: 'onBoarding', value: true).then((value)
                {
                  navTo(context, Login_Screen());
                });


              },
              child: const Text('التالي'),
            ),
        ],
      ),
    );
  }
}
