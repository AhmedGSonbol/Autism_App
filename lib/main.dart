// ignore_for_file: unused_local_variable, unused_import, unnecessary_import

import 'package:autism/Modules/Admin/suggestions/suggestions_screen.dart';
import 'package:autism/Modules/onboarding/onboarding_Screen.dart';
import 'package:autism/Modules/home/home_Screen.dart';
import 'package:autism/Modules/register/register_Screen.dart';
import 'package:autism/Modules/search/search_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/network/local/Cach_Helper.dart';
import 'package:autism/Shared/network/remote/dio_Helper.dart';
import 'package:autism/Shared/styles/app_Themes.dart';
import 'package:autism/generated/l10n.dart';
import 'package:autism/modules/login/login_Screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Shared/Classes/bloc_observer.dart';
import 'dart:io';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async
{

  HttpOverrides.global = MyHttpOverrides();

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
    screen = const OnBoardingScreen();
  }

  bool isDark = CachHelper.getData(key: 'isdarkmode') ?? false;

  current_lang = CachHelper.getData(key: 'lang') ?? 'en';

  return runApp(
      BlocProvider(
        create: (context) => AppCubit()..isDarkMode = isDark..getAppData(),
        // create: (context) => AppCubit()..getAppData(),
          child: BlocConsumer<AppCubit,AppStates>(
            listener: (context, state) {},
            builder: (context, state)
            {
              return MaterialApp(
                localizationsDelegates:
                const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,

                locale:  Locale(current_lang),

                debugShowCheckedModeBanner: false,
                darkTheme: myDarkTheme,
                theme: myLightTheme,
                themeMode: AppCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
                home: screen,
                // home: Search_Screen(),
              );

            },
          )
  ),);
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}