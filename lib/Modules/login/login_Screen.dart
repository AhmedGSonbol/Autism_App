// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors, unused_import

import 'package:autism/Models/home_doctor/home_doctor_screen.dart';
import 'package:autism/Modules/Admin/home/admin_Home_Screen.dart';
import 'package:autism/Modules/Doctor/home/doctor_home_Screen.dart';
import 'package:autism/Modules/home/home_Screen.dart';
import 'package:autism/Modules/login/cubit/login_Cubit.dart';
import 'package:autism/Modules/login/cubit/login_States.dart';
import 'package:autism/Modules/register/register_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});

  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsetsDirectional.all(30),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        'assets/images/icon.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            color: Color(0xffD9D9D9),
                            // fontFamily: 'Roboto',
                            // height: 2,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'إلى حسابك في مجتمع التوحد',
                        style: TextStyle(
                          color: Color(0xffD9D9D9),
                          // fontFamily: 'Roboto',
                          // height: 2,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 31,
                      ),
                      defaultTextFormField(
                          controller: emailCon,
                          type: TextInputType.emailAddress,
                          hint: 'الإيميل',
                          validate: (value) {
                            if (value == '') {
                              return 'مطلوب*';
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultTextFormField(
                          controller: passCon,
                          type: TextInputType.visiblePassword,
                          hint: 'الرقم السري',
                          iconButton: IconButton(
                            icon: Icon(
                              cubit.isPassVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: fontColor,
                            ),
                            onPressed: () {
                              cubit.changePassVisibility();
                            },
                          ),
                          isPass: !cubit.isPassVisible,
                          style: const TextStyle(color: Colors.white),
                          validate: (value) {
                            if (value == '') {
                              return 'مطلوب*';
                            }
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'هل نسيت الرقم السري ؟',
                            style: TextStyle(
                              color: Color(0xffA8C8FF),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (cubit.isAdmin) {
                            // navTo(context, Admin_Home_Screen());
                            navTo(context, Doctor_Home_Screen());
                          } else {
                            navTo(context, Home_Screen());
                            // navTo(context, Doctor_Home_Screen());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffA8C8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                        // shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(5.0),
                        child: const SizedBox(
                          width: 60,
                          height: 40,
                          child: Center(
                            child: Text(
                              'دخول',
                              style: TextStyle(
                                  color: Color(0xff05305F),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff43474E),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                navTo(context, Register_Screen());
                              },
                              child: const Text(
                                'إنشاء',
                                style: TextStyle(
                                    color: Color(0xffA8C8FF), fontSize: 16),
                              ),
                            ),
                            ////////////////////////////
                            // SizedBox(
                            //   width: 60,
                            // ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                'يمكنك انشاء حساب جديد من هنا',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
