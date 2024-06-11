// ignore_for_file: unused_local_variable, unused_import, unnecessary_import

import 'package:autism/Modules/Admin/suggestions/suggestions_screen.dart';
import 'package:autism/Modules/onboarding/onboarding_Screen.dart';
import 'package:autism/Modules/home/home_Screen.dart';
import 'package:autism/Modules/register/register_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/network/local/Cach_Helper.dart';
import 'package:autism/Shared/network/remote/dio_Helper.dart';
import 'package:autism/Shared/styles/app_Themes.dart';
import 'package:autism/modules/login/login_Screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Shared/Classes/bloc_observer.dart';

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  await CachHelper.init();

  Widget screen;
  if (CachHelper.getData(key: 'ShowBoarding') != null)
  {
    if(CachHelper.getData(key: 'token') != null )
    {

      if(CachHelper.getData(key: 'user_type') != null )
      {
        token = CachHelper.getData(key: 'token');

        userType = CachHelper.getData(key: 'user_type');

        // userType ='admin';
        screen = Home_Screen();

        // if(userType == 'patient' || userType == 'doctor')
        // {
        //   screen = Home_Screen();
        // }
        // else
        // {
        //   screen = Admin_Home_Screen();
        // }

      }
      else
      {
        screen = Login_Screen();
      }

    }
    else
    {
      screen = Login_Screen();
    }

  }
  else
  {
    screen = OnBoardingScreen();
  }

  // screen = Suggestions_Screen();

  // screen = Login_Screen();

  return runApp(
      BlocProvider(
          create: (context) => AppCubit()..getAppData(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: myDarkTheme,
            themeMode: ThemeMode.dark,
            home: screen,
  )
  ));
}
