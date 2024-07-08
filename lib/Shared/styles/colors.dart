import 'dart:ui';

import 'package:autism/Shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// const Color onBoardingBackgroundColor = Color(0xff111318); //#eeece7

const Color mainColor = Color(0xff478bff);

const Color secondColor = Color(0xff478bff);

// const Color secondColor = Color(0xffef9eff);

// const Color backgroundColor = Color(0xff111318); //#eeece7

class AppColors
{
  AppColors(this.context);

  BuildContext context;

  Color fontColor()
  {
    if(AppCubit.get(context).isDarkMode == true)
    {
      return const Color(0xffE1E2E9);
    }
    else
    {
      return const Color(0xff1e1d16);
    }
  }

  Color backgroundColor()
  {
    if(AppCubit.get(context).isDarkMode == true)
    {
      return const Color(0xff111318);
    }
    else
    {
      return const Color(0xffeeece7);
    }
  }

  Color home_drawer_item_background()
  {
    if(AppCubit.get(context).isDarkMode == true)
    {
      return const Color(0xff43474E);
    }
    else
    {
      return const Color(0xffbcb8b1);
    }
  }

  Color home_drawer_email_color()
  {
    if(AppCubit.get(context).isDarkMode == true)
    {
      return const Color(0xffCCCCCC);
    }
    else
    {
      return const Color(0xff333333);
    }
  }

  Color home_drawer_background_color()
  {
    if(AppCubit.get(context).isDarkMode == true)
    {
      return const Color(0xff282a2f);

    }
    else
    {
      return const Color(0xffE1E2E9);
    }
  }

  Color post_background_color()
  {
    if(AppCubit.get(context).isDarkMode == true)
    {
      return const Color(0xff292A2D);

    }
    else
    {
      return const Color(0xffd6d5d2);
    }
  }

}


// const Color fontColor = Color(0xffE1E2E9);
const Color appBarColor = Color(0xff1D2024);

const Color appGreenColor = Color(0xFF00d184);

const Color appRedColor = Color(0xffE27676);
