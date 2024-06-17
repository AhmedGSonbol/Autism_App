// ignore_for_file: prefer_const_constructors

import 'package:autism/Models/admin_Users_Model.dart';
import 'package:autism/Modules/Admin/manage_Admins/manage_Accounts_Screen.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Doctor_Accounts_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context)
  {
    var cubit = AppCubit.get(context);
    cubit.getAllDoctors();

    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context, state) {},
      builder: (context, state)
      {
        return
        (()
        {
          if(cubit.allDoctors != null || cubit.adminSearchResults != null)
          {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 20.0),
              itemBuilder: (context, index) {
                return Directionality(
                    textDirection: TextDirection.rtl,
                    child: buildDoctorsAccountsItems(context,
                        cubit.adminSearchResults != null ?
                        cubit.adminSearchResults!.admin_UsersData[index]
                            :
                        cubit.allDoctors!.admin_UsersData[index]
                    ));
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemCount: cubit.adminSearchResults != null
                  ? cubit.adminSearchResults!.admin_UsersData.length
                  :cubit.allDoctors!.admin_UsersData.length,
            );
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(color: mainColor,),
            );
          }
        }
          ());
      },
    );


  }
}

Widget buildDoctorsAccountsItems(BuildContext context , Admin_UsersData model) => Padding(
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
              color: Color(0xffA8C8FF),
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
