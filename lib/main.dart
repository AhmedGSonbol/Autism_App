import 'package:autism/modules/login/login_Screen.dart';
import 'package:autism/modules/onboarding/onboarding_Screen.dart';
import 'package:flutter/material.dart';

import 'shared/network/local/Cach_Helper.dart';




void main()
{

  CachHelper.init();

  Widget screen = Login_Screen();
  print('sss');
  print(CachHelper.getData(key: 'onBoarding'));

  if (CachHelper.getData(key: 'onBoarding') == null) {
    screen = OnboardingScreen();
  }
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
          fontFamily: 'Roboto'
      ),
      //fontfamily
      // theme: ThemeData(fontFamily: 'Roboto'),
      // theme: whatsappTheme,
      home: screen,
    ),
  );
} 
//UserHome() -->the important

//SplashScreen()

//Home2()

//ChatPage

//TestScreen1()

//TestSplash()

// UserSetting()