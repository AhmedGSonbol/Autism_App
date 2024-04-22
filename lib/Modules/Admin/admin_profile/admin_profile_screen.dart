// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Admin_Profile_Screen extends StatelessWidget {
  Admin_Profile_Screen({super.key});

  var nameCon = TextEditingController();
  var passCon = TextEditingController();
  var emailCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: const Color(0xff43474E),
            title: const Text(
              'الملف الشخصي',
              style: TextStyle(color: fontColor),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: const Color(0xffE1E2E9),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        color: Color(0xff43474E),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 125,
                      child: Image.asset('assets/images/Ellipse 18.png'),
                    ),
                    Positioned(
                      top: 155,
                      left: 225,
                      child: IconButton(
                        icon: Image.asset(
                            'assets/images/Icon button toggleable-dark.png'),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultTextFormField(
                            controller: nameCon,
                            type: TextInputType.emailAddress,
                            label: 'الإسم',
                            validate: (value) {
                              if (value == '') {
                                return 'مطلوب*';
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                            controller: emailCon,
                            type: TextInputType.emailAddress,
                            label: 'الإيميل',
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
                            label: 'الرقم السري',
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
                        SizedBox(
                          height: 200,
                        ),
                        Divider(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultElevatedButton(
                              text: 'إلغاء',
                              color: secondColor,
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            defaultElevatedButton(
                              text: 'حفظ',
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
