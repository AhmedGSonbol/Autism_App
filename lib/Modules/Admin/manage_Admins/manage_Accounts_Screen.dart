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

class Manage_Admins_Screen extends StatelessWidget
{
  Manage_Admins_Screen({super.key});
  List<Widget> screens =
  [
    Admin_Accounts_Screen(),
    Doctor_Accounts_Screen(),
    User_Accounts_Screen(),

  ];

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state)
      {
        if (state is SuccessDeleteUserState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
        }
        else if (state is ErrorDeleteUserState)
        {
          myToast(msg: state.message.contains('Only super admin can delete admins') ? 'يمكن للمسؤول الرئيسي فقط حذف باقي المسؤولين !' : state.message, state: ToastStates.ERROR);
        }

      },
      builder: (context, state)
      {
        AppColors colors = AppColors(context);

        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: RefreshIndicator(
              onRefresh: ()async
              {
                if(cubit.currentAccountsScreen == 0)
                {
                  await AppCubit.get(context).getAllAdmins(isReferesh: true);
                }else if(cubit.currentAccountsScreen == 1)
                {
                  await AppCubit.get(context).getAllDoctors(isReferesh: true);
                }else
                {
                  await AppCubit.get(context).getAllPatients(isReferesh: true);
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: myNavBar(
                            context,
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
                            controller: searchController,
                            style:  TextStyle(color: colors.fontColor()),
                            decoration: InputDecoration(

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: colors.fontColor())
                              ),
                              hintText: 'إكتب شئ',

                              suffixIcon: IconButton(
                                icon: Transform.rotate(
                                  angle: 0,
                                  child:  Icon(Icons.search,color: colors.fontColor(),),
                                ),
                                onPressed: ()
                                {
                                  cubit.adminSearch(searchController.text);
                                },
                              ),
                            ),
                            onSubmitted: (val)
                            {
                              cubit.adminSearch(val);
                            },
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
          ),
        );
      },
    );
  }
}
