
import 'package:autism/Modules/onboarding/onboarding_Screen.dart';
import 'package:autism/Modules/home/home_Screen.dart';
import 'package:autism/Modules/register/register_Screen.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/styles/app_Themes.dart';
import 'package:autism/modules/login/login_Screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Shared/Classes/bloc_observer.dart';
import 'shared/network/local/Cach_Helper.dart';




void main() async
{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CachHelper.init();


  Widget screen;

  // if(CachHelper.getData(key: 'ShowBoarding') != null)
  // {
  //
  //     screen = Login_Screen();
  //
  // }
  // else
  // {
  //   // screen = OnBoardingScreen();
  //   screen = OnBoardingScreen();
  // }

  bool isAdmin = false;
  screen = Login_Screen();


  return runApp(

    BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: myDarkTheme,
        themeMode: ThemeMode.dark,

        home: screen,
      ),
    )


  );
}