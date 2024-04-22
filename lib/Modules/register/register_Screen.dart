// ignore_for_file: prefer_const_constructors

import 'package:autism/Modules/register/doctor_account1.dart';
import 'package:autism/Modules/register/doctor_account2.dart';
import 'package:autism/Modules/register/doctor_account3.dart';
import 'package:autism/Modules/register/user_account1.dart';
import 'package:autism/Modules/register/user_account3.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/modules/register/user_account2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register_Screen extends StatelessWidget {
  Register_Screen({super.key});

  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> userScreens = [
      UserAccount1(
        formKey: formKey,
      ),
      UserAccount2(formKey),
      UserAccount3(),
    ];

    List<Widget> docScreens = [
      DoctorAccount1(
        formKey: formKey,
      ),
      DoctorAccount2(
        formKey: formKey,
      ),
      DoctorAccount3()
    ];
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: fontColor,
            ),
          ),
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsetsDirectional.all(30),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cubit.currentRegScreen == 2
                        ? 'إكتمل إنشاء حسابك'
                        : 'إنشاء حساب جديد',
                    style: TextStyle(
                      color: Color(0xffD9D9D9),
                      height: 2,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (cubit.currentRegScreen == 0)
                    myNavBar(
                      selectedIndex: cubit.currentRegScreenType,
                      text: ['طبيب', 'أب / أم'],
                      onDestinationSelected: (index) {
                        cubit.currentRegScreen = 0;
                        cubit.changeCurrentRegScreenType(index);
                      },
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  (() {
                    if (cubit.currentRegScreenType == 0) {
                      return docScreens[cubit.currentRegScreen];
                    } else {
                      return userScreens[cubit.currentRegScreen];
                    }
                  }()),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      defaultButton(
                        text: 'التالي',
                        radius: 50,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.changeCurrentRegScreen(
                                cubit.currentRegScreen + 1);
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
