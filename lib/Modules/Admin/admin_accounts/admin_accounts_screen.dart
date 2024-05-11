// ignore_for_file: prefer_const_constructors

import 'package:autism/Models/admin_Users_Model.dart';
import 'package:autism/Modules/Admin/manage_Admins/manage_Accounts_Screen.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Admin_Accounts_Screen extends StatelessWidget {
  const Admin_Accounts_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {

    AppCubit.get(context).getAllAdmins();

    return BlocConsumer<AppCubit,AppStates>
      (
        listener: (context, state) {},
        builder: (context, state) {
          return AppCubit.get(context).allAdmins == null
              ?
          Center(
            child: CircularProgressIndicator(color: mainColor,),
          )
              :
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 20.0),
            itemBuilder: (context, index) {
              return Directionality(
                  textDirection: TextDirection.rtl,
                  child: buildAdminsAccountsItems(context,AppCubit.get(context).allAdmins!.admin_UsersData[index]));
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 10.0,
            ),
            itemCount: AppCubit.get(context).allAdmins!.admin_UsersData.length,
          );
        },);

  }
}

Widget buildAdminsAccountsItems(BuildContext context , Admin_UsersData model) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xff292A2D),
              borderRadius: BorderRadiusDirectional.circular(30),
              border: Border(
                top: BorderSide(
                  color: Color(0xffFFB4AB),
                  width: 5,
                ),
              )),
          child: Column(
            children:
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:
                          [

                            Flexible(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xff43474E),
                                    borderRadius: BorderRadius.circular(30)),
                                child:  Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  model.name!,
                                  style: TextStyle(color: fontColor, fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            SizedBox(
                              width: 50.0,
                              child: Text(
                                textAlign: TextAlign.end,
                                'اﻹسم',
                                style: onBoardingDesc,
                              ),
                            ),

                            // Spacer(
                            //   flex: 6,
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xff43474E),
                                    borderRadius: BorderRadius.circular(30)),
                                child:  Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  model.email!,
                                  style: TextStyle(color: Color(0xffE1E2E9), fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            SizedBox(
                              width: 50.0,
                              child: Text(
                                textAlign: TextAlign.end,
                                'اﻹيميل',
                                style: onBoardingDesc,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  myImageProvider(model.image),

                ],
              ),


              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  defaultElevatedButton(
                    text: 'حذف',
                    color: secondColor,
                    onPressed: ()
                    {
                      AppCubit.get(context).deleteUser(model);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
