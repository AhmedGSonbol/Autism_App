
import 'package:autism/Modules/user_home/home_Screen.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/modules/login/login_Screen.dart';
import 'package:autism/modules/onboarding/onboarding_Screen.dart';
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


  Widget screen = Home_Screen();
  print('sss');
  print(CachHelper.getData(key: 'onBoarding'));

  if (CachHelper.getData(key: 'onBoarding') == null) {
    screen = Home_Screen();
  }
  return runApp(

    BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Roboto',
            dividerTheme: const DividerThemeData(color: Colors.transparent),
        ),
        home: screen,
      ),
    )


  );
}