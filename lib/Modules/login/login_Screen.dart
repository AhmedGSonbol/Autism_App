// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors, unused_import

import 'package:autism/Modules/home/home_Screen.dart';
import 'package:autism/Modules/login/cubit/login_Cubit.dart';
import 'package:autism/Modules/login/cubit/login_States.dart';
import 'package:autism/Modules/register/register_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/network/local/Cach_Helper.dart';
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
        listener: (context, state)
        {
          if(state is LoginSuccessState)
          {

              myToast(msg: state.model.message!, state: ToastStates.SUCCESS);

              CachHelper.saveData(key: 'token', value: state.model.token).then((value)
              {
                CachHelper.saveData(key: 'user_type', value: state.model.data!.user_type).then((value)
                {
                  token = state.model.token!;
                  userType = state.model.data!.user_type!;


                  AppCubit.get(context).getAppData();

                  navAndFinishTo(context, Home_Screen());


                  // if(userType == 'patient' || userType == 'doctor')
                  // {
                  //   navAndFinishTo(context, Home_Screen());
                  // }
                  // else
                  // {
                  //   navAndFinishTo(context, Admin_Home_Screen());
                  // }

                });
              });



          }
          else if(state is LoginErrorState)
          {
            print(state.error);

            myToast(msg: state.error,state: ToastStates.ERROR ,);
          }
        },
        builder: (context, state)
        {
          AppColors colors = AppColors(context);
          var cubit = LoginCubit.get(context);

          return Stack(
            children: [
              Scaffold(
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
                           Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                color: colors.fontColor(),
                                // fontFamily: 'Roboto',
                                // height: 2,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                            'إلى حسابك في مجتمع التوحد',
                            style: TextStyle(
                              color: colors.fontColor(),
                              // fontFamily: 'Roboto',
                              // height: 2,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 31,
                          ),
                          defaultTextFormField(
                              context: context,
                              controller: emailCon,
                              type: TextInputType.emailAddress,
                              hint: 'الإيميل',
                              validate: (value) {
                                if (value == '') {
                                  return 'مطلوب*';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextFormField(
                              context: context,
                              controller: passCon,
                              type: TextInputType.visiblePassword,
                              hint: 'الرقم السري',
                              iconButton: IconButton(
                                icon: Icon(
                                  cubit.isPassVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: colors.fontColor(),
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
                          InkWell(
                            onTap: ()
                            {

                              // navTo(context, Admin_Home_Screen());

                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Text(
                                //   'هل نسيت الرقم السري ؟',
                                //   style: TextStyle(
                                //     color: Color(0xffA8C8FF),
                                //   ),
                                // ),
                                SizedBox(
                                  width: 16,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          state is LoginLoadingState
                              ?
                          CircularProgressIndicator(
                            color: mainColor,
                          )
                              :
                              defaultButton(text: 'دخول', function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  cubit.userLogin(Email: emailCon.text, Password: passCon.text);
                                }
                              },
                                radius: 50 ,),
                          // ElevatedButton(
                          //   onPressed: ()
                          //   {
                          //
                          //
                          //
                          //
                          //     // if (cubit.isAdmin) {
                          //     //   // navTo(context, Admin_Home_Screen());
                          //     //   navTo(context, Doctor_Home_Screen());
                          //     // } else {
                          //     //   navTo(context, Home_Screen());
                          //     //   // navTo(context, Doctor_Home_Screen());
                          //     // }
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color(0xffA8C8FF),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(70),
                          //     ),
                          //   ),
                          //   // shape: RoundedRectangleBorder(
                          //   // borderRadius: BorderRadius.circular(5.0),
                          //   child:  SizedBox(
                          //     width: 60,
                          //     height: 40,
                          //     child: Center(
                          //       child: Text(
                          //         'دخول',
                          //         style: TextStyle(
                          //             color: Color(0xff05305F),
                          //             fontSize: 17,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: colors.home_drawer_item_background(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      navTo(context, Register_Screen());
                                    },
                                    child:  Text(
                                      'إنشاء',
                                      style: TextStyle(
                                          color: mainColor, fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  ////////////////////////////
                                  // SizedBox(
                                  //   width: 60,
                                  // ),
                                  const Spacer(),
                                   Text(
                                     'يمكنك انشاء حساب جديد من هنا',
                                     style: TextStyle(
                                         color: colors.fontColor(), fontSize: 16),
                                   ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if(state is LoginLoadingState)
                Positioned.fill(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
