import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData myDarkTheme = ThemeData(

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xff254777)
  ),

    unselectedWidgetColor:Colors.yellowAccent,

  dividerTheme: const DividerThemeData(color: Colors.transparent),

  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xffA8C8FF),
      secondary: Color(0xffA8C8FF)

  ),
    scaffoldBackgroundColor: Color(0xff111318),

    appBarTheme: const AppBarTheme(
        //Control Status bar

        // systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Color(0xff1D2024),
        //     statusBarIconBrightness: Brightness.light,
        //
        // ),
        /////////////////////
        titleSpacing: 20.0,
        backgroundColor: Color(0xff1D2024),
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        titleTextStyle:TextStyle(
            color: Color(0xffE1E2E9),
            fontFamily: 'Roboto',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,

        ),

        iconTheme:IconThemeData(color: Color(0xffE1E2E9))),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Color(0xff1D2024),
      shadowColor: Colors.yellowAccent,
      indicatorColor: Color(0xFF3D4758),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) =>

              TextStyle(color: Color(0xffE1E2E9))

      )),


    fontFamily: 'Roboto',



    useMaterial3: true,

    hintColor: Color(0xffE1E2E9),
  drawerTheme: DrawerThemeData(
    elevation: 0,
    backgroundColor: const Color(0xff282a2f),
  ),

    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //     backgroundColor: Colors.white,
    //     foregroundColor: Colors.black,
    //     elevation: 10.0,
    // ),
    //
    // popupMenuTheme: const PopupMenuThemeData(
    //     color: Colors.grey,
    //
    // ),
    //
    //
);

ThemeData myLightTheme = ThemeData(


  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xff254777)
  ),

  unselectedWidgetColor:Colors.yellowAccent,

  drawerTheme: DrawerThemeData(
    backgroundColor: const Color(0xffE1E2E9),
    elevation: 0,
  ),

  dividerTheme: const DividerThemeData(color: Colors.transparent),

  hintColor: Color(0xff1e1d16),
  // primarySwatch: Color(0xffA8C8FF),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Color(0xffA8C8FF),
    secondary: Color(0xffA8C8FF)

  ),
  // scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
  scaffoldBackgroundColor: Color(0xffeeece7),
  appBarTheme: const AppBarTheme(
    //Control Status bar
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //       statusBarColor: Colors.white,
    //       statusBarIconBrightness: Brightness.dark),
      /////////////////////
      titleSpacing: 20.0,
      backgroundColor: Color(0xffE1E2E9),
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      titleTextStyle: TextStyle(
        color: Color(0xff1e1d16),
        fontFamily: 'Jannah',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Color(0xff1e1d16))),


  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Color(0xffE1E2E9),
      indicatorColor: Colors.white,
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) =>

              TextStyle(color: Colors.black)

      )),

  fontFamily: 'Roboto',
  useMaterial3: true,
);