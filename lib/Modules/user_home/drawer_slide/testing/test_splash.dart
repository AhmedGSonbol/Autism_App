// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:autism/Modules/user_home/drawer_slide/testing/test1.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestSplash extends StatelessWidget {
  const TestSplash({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          backgroundColor: Color(0xff1d2024),
          appBar: AppBar(
            backgroundColor: Color(0xff1d2024),
            title: Text(
              'التشخيص',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Color(0xffE1E2E9),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image(
                    image: AssetImage('assets/images/test1.png'),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 3,
                  ),


                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    ' تشخيص أولي مبني على الذكاء  اﻹصطناعي لقياس مدى قابلية طفلك للأصابة بالتوحد و من ثم اتخذ القرار المناسب',
                    style: TextStyle(
                        color: Color(0xffE1E2E9),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Divider(
                  thickness: .5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16),
                      child: defaultElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return TestScreen1();
                            }),
                          );
                        },
                        text: 'التالي',
                        color: Color(0xffA8C8FF),
                        textColor: Color(0xff05305F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

      },

    );
  }
}
