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
import 'package:autism/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});

  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    var la = S.of(context);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state)
        {
          if(state is LoginSuccessState)
          {

              // myToast(msg: la.success_login, state: ToastStates.SUCCESS);

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

            if(state.error.contains('بيانات الدخول غير صحيحة !'))
            {
              myToast(msg: la.loginDataIncorrect,state: ToastStates.ERROR ,);
            }
            else if(state.error.contains('في إنتظار موافقة المسؤول !'))
            {
              myToast(msg: la.loginPendingError,state: ToastStates.ERROR ,);
            }
            else
            {
              myToast(msg: la.connectioError,state: ToastStates.ERROR ,);
            }


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
                        children:
                        [
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
                            la.login_screen_title,
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
                            la.login_screen_subtitle,
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
                              hint: la.email,
                              validate: (value) {
                                if (value == '') {
                                  return la.Required;
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextFormField(
                            onFieldSubmitted: (val)
                            {
                              if(formKey.currentState!.validate())
                              {
                                cubit.userLogin(Email: emailCon.text, Password: passCon.text);
                              }
                            },
                              context: context,
                              controller: passCon,
                              type: TextInputType.visiblePassword,
                              hint: la.password,
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
                                  return la.Required;
                                }
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          // InkWell(
                          //   onTap: ()
                          //   {
                          //
                          //     // navTo(context, Admin_Home_Screen());
                          //
                          //   },
                          //   child:  Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       // Text(
                          //       //   'هل نسيت الرقم السري ؟',
                          //       //   style: TextStyle(
                          //       //     color: Color(0xffA8C8FF),
                          //       //   ),
                          //       // ),
                          //       SizedBox(
                          //         width: 16,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          state is LoginLoadingState
                              ?
                          CircularProgressIndicator(
                            color: mainColor,
                          )
                              :
                              defaultButton(text: la.login_button, function: ()
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

                            
                            decoration: BoxDecoration(
                              color: colors.home_drawer_item_background(),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0),
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all( 5.0),
                              child: Column(
                                children:
                                [
                                  Column(
                                    children:
                                    [
                                      Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 5,
                                        la.create_account_description,
                                        style: TextStyle(
                                            color: colors.fontColor(), fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children:
                                    [
                                      TextButton(
                                        onPressed: () {
                                          navTo(context, Register_Screen());
                                        },

                                        child:  Text(
                                          la.create_account,
                                          style: TextStyle(
                                              color: mainColor, fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children:
                                    [

                                      // const Spacer(),



                                    ],
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
