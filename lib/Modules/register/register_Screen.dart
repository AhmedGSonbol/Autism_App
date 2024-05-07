// ignore_for_file: prefer_const_constructors

import 'package:autism/Modules/login/login_Screen.dart';
import 'package:autism/Modules/register/cubit/register_Cubit.dart';
import 'package:autism/Modules/register/cubit/register_States.dart';
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
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:autism/modules/register/user_account2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class Register_Screen extends StatelessWidget {
  Register_Screen({super.key});

  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  final TextEditingController nameCon = TextEditingController();
  final TextEditingController ageCon = TextEditingController();
  final TextEditingController cityCon = TextEditingController();
  final TextEditingController governmentCon = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(create: (context) => RegisterCubit(),
    child: BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state)
      {
        if(state is RegisterSuccessState)
        {
          if(state.isPatient == true)
          {
            myToast(msg: 'تم تسجيل حسابك بنجاح', state: ToastStates.SUCCESS);
          }
          else
          {
            myToast(msg: 'تم تسجيل حسابك بنجاح, في انتظار موافقة المسؤول', state: ToastStates.SUCCESS);
          }
          navAndFinishTo(context, Login_Screen());

        }
        else if(state is RegisterErrorState)
        {
        print(state.error);

        myToast(msg: state.error,state: ToastStates.ERROR ,);
        }
      },
      builder: (context, state)
      {

        var cubit = RegisterCubit.get(context);


        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: IconButton(
              onPressed: ()
              {
                cubit.changeCurrentRegScreen(0);

                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: fontColor,
            ),
          ),
          backgroundColor: backgroundColor,
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            height: 100,
            color: Colors.transparent,
            elevation: 0,

            child: Column(
              children:
              [
                const Divider(
                  thickness: .5,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children:
                    [
                      defaultButton(
                        text: cubit.currentRegScreen != 2 ?'التالي' : 'إنشاء الحساب',
                        radius: 50 ,
                        width:cubit.currentRegScreen != 2 ? 100 : 120 ,
                        function: ()
                        {
                          if(cubit.currentRegScreen != 2)
                          {
                            if (formKey.currentState!.validate())
                            {
                              if(cubit.currentRegScreenType == 0 && cubit.currentRegScreen == 1 && cubit.cv == null)
                              {
                                myToast(msg: 'برجاء رفع الـ CV الخاص بك اولاً', state: ToastStates.ERROR);
                              }else
                              {
                                cubit.changeCurrentRegScreen(
                                    cubit.currentRegScreen + 1);
                              }

                            }
                          }
                          else
                          {
                            ///create the account
                            /// doctor
                            if(cubit.currentRegScreenType == 0)
                            {
                              cubit.doctorRegister(
                                name: nameCon.text,
                                email: emailCon.text,
                                phone: phoneCon.text,
                                password: passCon.text,
                                government: governmentCon.text,
                                city: cityCon.text,

                              );
                            }

                            ///patient
                            else
                            {
                              cubit.patientRegister(
                                name: nameCon.text,
                                email: emailCon.text,
                                phone: phoneCon.text,
                                password: passCon.text,
                                government: governmentCon.text,
                                city: cityCon.text,
                                age: ageCon.text,
                              );
                            }

                          }

                        },
                      ),



                      SizedBox(width: 10.0,),
                      if(cubit.currentRegScreen > 0)
                        defaultButton(
                          text: 'السابق',
                          radius: 50,
                          function: ()
                          {
                            try {
                              formKey.currentState!.reset();
                            }catch(excption){}

                            cubit.changeCurrentRegScreen(
                                cubit.currentRegScreen - 1);

                          },
                        ),
                    ],
                  ),
                )

              ],
            ),
          ),
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
                      onDestinationSelected: (index)
                      {
                        nameCon.clear();
                        emailCon.clear();
                        cityCon.clear();
                        governmentCon.clear();
                        phoneCon.clear();
                        passCon.clear();
                        confirmPassCon.clear();
                        ageCon.clear();

                        if(cubit.avatarImage != null)
                        {
                          cubit.avatarImage = null;
                        }

                        if(cubit.cv != null)
                        {
                          cubit.cv = null;
                        }


                        cubit.currentRegScreen = 0;
                        cubit.changeCurrentRegScreenType(index);
                      },
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  (() {
                    /// Content Here
                    if (cubit.currentRegScreenType == 0)
                    {
                      if(cubit.currentRegScreen == 0)
                      {
                        ///Doctor register screen 1
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:
                            [
                              defaultTextFormField(
                                  controller: nameCon,
                                  type: TextInputType.name,

                                  hint: 'الأسم',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else if(value!.length < 5)
                                    {
                                      return 'الأسم يجب الا يقل عن 5 حروف !';
                                    }
                                  }),

                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: cityCon,
                                  type: TextInputType.text,

                                  hint: 'الدولة',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else  if (value!.length <3) {
                                      return 'الدولة يجب الا تقل عن 3 احرف';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: governmentCon,
                                  type: TextInputType.text,

                                  hint: 'المحافظة',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب* ';
                                    } else  if (value!.length <3) {
                                      return 'المحافظة يجب الا تقل عن 3 احرف';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: phoneCon,
                                  type: TextInputType.phone,
                                  hint: 'الهاتف',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else if (value!.length != 11) {
                                      return 'رقم الهاتف يجب ان يكون 11 رقم !';
                                    }
                                  }),
                            ],
                          ),
                        );
                      }
                      else if(cubit.currentRegScreen == 1)
                      {
                        ///Doctor register screen 2
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              defaultTextFormField(
                                  controller: emailCon,
                                  type: TextInputType.emailAddress,
                                  hint: 'الإيميل',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else if(!value!.contains('@') || !value.contains('.') || value.length < 7)
                                    {
                                      return 'برجاء كتابة الايميل بشكل صحيح !';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: passCon,
                                  type: TextInputType.text,
                                  hint: 'إنشاء الرقم سري',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else if (value!.length < 6) {
                                      return 'لا يمكن انشاء رقم سري اقل من 6 احرف او ارقام';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: confirmPassCon,
                                  type: TextInputType.text,
                                  hint: 'تأكيد الرقم السري',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب* ';
                                    }else if(passCon.text != value)
                                    {
                                      return 'برجاء إعادة كتابة كلمة السر بشكل صحيح !';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              ///CV
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xff8E9099), width: .5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    cubit.cv == null
                                        ?
                                  IconButton(
                                  icon: const CircleAvatar(
                                child: Icon(
                                Icons.upload,
                                  size: 20.0,
                                ),
                                backgroundColor: mainColor,
                              ),
                          onPressed: ()
                          {//A8C8FF
                            ///upload image
                            cubit.pickCV();

                          },
                        )
                                        :
                                    IconButton(
                                      icon: const CircleAvatar(
                                        child: Icon(
                                          Icons.close,
                                          size: 20.0,
                                        ),
                                        backgroundColor: mainColor,
                                      ),
                                      onPressed: ()
                                      {//A8C8FF
                                        ///upload cv
                                        cubit.cancelUploadedCV();

                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      'PDF',
                                      style: TextStyle(
                                        color: Color(0xffFFB4AB),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        cubit.cv == null
                                            ?
                                        'ارفع ملف تعريف الهوية'
                                            :
                                        basename(cubit.cv!.path),

                                        style: onBoardingDesc,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      else
                      {
                        ///Doctor register screen 3
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children:
                              [
                                CircleAvatar(

                                  backgroundImage: cubit.avatarImage == null ? AssetImage('assets/images/account_circle.png') : FileImage(cubit.avatarImage!) as ImageProvider  ,
                                  radius: 64.0,
                                  backgroundColor: backgroundColor,
                                ),
                                cubit.avatarImage == null
                                    ?
                                IconButton(
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.upload,
                                      size: 20.0,
                                    ),
                                    backgroundColor: mainColor,
                                  ),
                                  onPressed: ()
                                  {//A8C8FF
                                    ///upload image
                                    cubit.pickImage();

                                  },
                                )
                                    :
                                IconButton(
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.close,
                                      size: 20.0,
                                    ),
                                    backgroundColor: mainColor,
                                  ),
                                  onPressed: ()
                                  {
                                    ///delete image
                                    cubit.cancelUploadedProfileImage();

                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              textAlign: TextAlign.center,
                              'تهانينا, لقد إكتمل إنشاء حسابك و اﻷن يمكنك المساهم في نشر الوعي و مساعدت أطفال طيف التوحد ',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontFamily: 'Roboto',
                                  height: 2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            // const SizedBox(
                            //   height: 30,
                            // ),

                          ],
                        );
                      }

                    } else
                    {

                      if(cubit.currentRegScreen == 0)
                      {
                        ///patient register screen 1
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:
                            [

                              defaultTextFormField(
                                  controller: nameCon,
                                  type: TextInputType.name,
                                  hint: 'الأسم',
                                  validate: (value) {
                                    if (value == '') {

                                      return 'مطلوب*';
                                    }else if(value!.length < 5)
                                    {
                                      return 'الأسم يجب الا يقل عن 5 حروف !';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: ageCon,
                                  type: TextInputType.number,

                                  hint: 'سن الطفل',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }
                                    else if (int.parse(value!) > 3 || int.parse(value) < 0) {
                                      return 'العمر يجب ان يكون ما بين سنه الي 3 سنوات';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: cityCon,
                                  type: TextInputType.text,

                                  hint: 'الدولة',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    } else  if (value!.length <3) {
                                      return 'الدولة يجب الا تقل عن 3 احرف';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: governmentCon,
                                  type: TextInputType.text,

                                  hint: 'المحافظة',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب* ';
                                    } else  if (value!.length <3) {
                                      return 'المحافظة يجب الا تقل عن 3 احرف';
                                    }
                                  }),
                            ],
                          ),
                        );
                      }
                      else if(cubit.currentRegScreen == 1)
                      {
                        ///patient register screen 2
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              defaultTextFormField(
                                  controller: phoneCon,
                                  type: TextInputType.phone,

                                  hint: 'الهاتف',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else if (value!.length != 11) {
                                      return 'رقم الهاتف يجب ان يكون 11 رقم !';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: emailCon,
                                  type: TextInputType.emailAddress,

                                  hint: 'الإيميل',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else if(!value!.contains('@') || !value.contains('.') || value.length < 7)
                                    {
                                      return 'برجاء كتابة الايميل بشكل صحيح !';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: passCon,
                                  type: TextInputType.text,

                                  hint: 'إنشاء الرقم سري',
                                  validate: (value) {
                                    if (value == '') {
                                      return 'مطلوب*';
                                    }else if (value!.length < 6) {
                                      return 'لا يمكن انشاء رقم سري اقل من 6 احرف او ارقام';
                                    }
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              defaultTextFormField(
                                  controller: confirmPassCon,
                                  type: TextInputType.text,

                                  hint: 'تأكيد الرقم السري',
                                  validate: (value) {
                                    if (value == '')
                                    {
                                      return 'مطلوب*';
                                    }
                                    else if(passCon.text != value)
                                    {
                                      return 'برجاء إعادة كتابة كلمة السر بشكل صحيح !';
                                    }
                                  }),
                            ],
                          ),
                        );
                      }
                      else
                      {
                        ///patient register screen 3
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children:
                              [
                                CircleAvatar(

                                  backgroundImage: cubit.avatarImage == null ? AssetImage('assets/images/account_circle.png') : FileImage(cubit.avatarImage!) as ImageProvider  ,
                                  radius: 64.0,
                                  backgroundColor: backgroundColor,
                                  ),
                                cubit.avatarImage == null
                                    ?
                                IconButton(
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.upload,
                                      size: 20.0,
                                    ),
                                    backgroundColor: mainColor,
                                  ),
                                  onPressed: ()
                                  {//A8C8FF
                                    ///upload image
                                    cubit.pickImage();

                                  },
                                )
                                    :
                                IconButton(
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.close,
                                      size: 20.0,
                                    ),
                                    backgroundColor: mainColor,
                                  ),
                                  onPressed: ()
                                  {
                                    ///delete image
                                    cubit.cancelUploadedProfileImage();

                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'تهانينا, لقد إكتمل إنشاء حسابك',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontFamily: 'Roboto',
                                  height: 2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'و الأن ستبدأ الرحلة',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontFamily: 'Roboto',
                                  height: 2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),

                          ],
                        );
                      }

                    }
                  }()),


                ],
              ),
            ),
          ),
        );
      },
    ),
    );

  }
}
