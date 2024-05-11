// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:autism/Models/reportedPost_Model.dart';
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
import 'package:intl/intl.dart' as intl;

class Complaints_Screen extends StatelessWidget {
  const Complaints_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    AppCubit.get(context).getReportedPosts();
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state)
        {
          if(state is SuccessConfirmReportedPostState)
          {
            myToast(msg: state.message, state: ToastStates.SUCCESS);
          }
          else if(state is SuccessRejectReportedPostState)
          {
            myToast(msg: state.message, state: ToastStates.SUCCESS);
          }
        },
        builder: (context, state)
        {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
              child:
              AppCubit.get(context).reportedPosts == null
                ?
            Center(
              child: CircularProgressIndicator(color: mainColor,),
            )
                :
              RefreshIndicator(
                onRefresh: ()async
                {
                  await AppCubit.get(context).getReportedPosts(isReferesh: true);

                },
                child: ListView.separated(
                  itemBuilder: ((context, index) => buildComplaintItems(context,AppCubit.get(context).reportedPosts!.reportedPostData[index])),
                  separatorBuilder: ((context, index) => SizedBox(
                    height: 10,
                  )),
                  itemCount: AppCubit.get(context).reportedPosts!.reportedPostData.length,
                ),
              ),
            ),
          );

        },);
  }

  Widget buildComplaintItems(BuildContext context, ReportedPostData model) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff292A2D),
            borderRadius: BorderRadiusDirectional.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),


                  myImageProvider(model.image) ,

                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      model.comp_to!,
                      style: onBoardingDesc,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  Text(
                    intl.DateFormat('yyyy/MM/dd').format(intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)),
                    style: TextStyle(color: Color(0xffE1E2E9), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.content!,
                    style: TextStyle(color: fontColor, fontSize: 20),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'الشكوه :  ${model.complaint}',
                    style: TextStyle(color: fontColor, fontSize: 18),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'الشاكي :  ',
                        style: TextStyle(color: fontColor, fontSize: 18,),
                      ),
                      Text(
                        model.comp_from!,
                        style: TextStyle(color: mainColor, fontSize: 18,),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  defaultElevatedButton(
                    text: 'إبقاء',
                    onPressed: ()
                    {
                      AppCubit.get(context).confirmReportedPost(model);
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  defaultElevatedButton(
                    text: 'حذف',
                    color: secondColor,
                    onPressed: ()
                    {
                      AppCubit.get(context).rejectReportedPost(model);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
