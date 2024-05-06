// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unnecessary_import

import 'package:autism/Modules/Admin/admin_accounts/admin_accounts_screen.dart';
import 'package:autism/Modules/Admin/doctor_accounts/doctor_accounts_screen.dart';
import 'package:autism/Modules/Admin/user_accounts/user_accounts_screen.dart';
import 'package:autism/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Manage_Admins_Screen extends StatelessWidget {
  Manage_Admins_Screen({super.key});
  List<Widget> screens = [
    Admin_Accounts_Screen(),
    Doctor_Accounts_Screen(),
    User_Accounts_Screen(),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: myNavBar(
                            selectedIndex: cubit.currentAccountsScreen,
                            text: ['مسؤول', 'طبيب', 'مريض'],
                            onDestinationSelected: (index) {
                              cubit.changeCurrentAccountScreen(index);
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                hintText: 'بحث',
                                hintStyle: const TextStyle(
                                  color: Color(0xffE1E2E9),
                                ),
                                suffixIcon: IconButton(
                                  icon: Transform.rotate(
                                    angle: 0,
                                    child: const Icon(
                                      Icons.search,
                                      color: fontColor,
                                    ),
                                  ),
                                  onPressed: () {},
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  screens[cubit.currentAccountsScreen]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
