// ignore_for_file: prefer_const_constructors

import 'package:autism/Modules/Admin/manage_Admins/manage_Accounts_Screen.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class Doctor_Accounts_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 20.0),
      itemBuilder: (context, index) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: buildUserAccountsItem(context));
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10.0,
      ),
      itemCount: 10,
    );
  }
}

Widget buildUserAccountsItem(BuildContext context) => Padding(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:
                    [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Color(0xff43474E),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              'د.محمد عمار',
                              style: TextStyle(color: fontColor, fontSize: 20),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            'اﻹسم',
                            style: onBoardingDesc,
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
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Color(0xff43474E),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              overflow: TextOverflow.ellipsis,
                              'adminame@gmail.com',
                              style: TextStyle(color: Color(0xffE1E2E9), fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            'اﻹيميل',
                            style: onBoardingDesc,
                          ),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  SizedBox(
                    height: 50.0,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/Rectangle (6).png',
                      ),
                    ),
                  ),

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
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
