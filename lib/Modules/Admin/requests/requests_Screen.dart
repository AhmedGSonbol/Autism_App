// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:autism/Models/pending_Doctors_Model.dart';
import 'package:autism/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:autism/Modules/pdf_Viewer/pdf_Viewer_screen.dart';
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

class Requests_Screen extends StatelessWidget {
  const Requests_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    AppCubit.get(context).getPending();
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state)
        {
          if(state is SuccessConfirmDoctorsState)
          {
            myToast(msg: state.message, state: ToastStates.SUCCESS);
          }
          else if(state is ErrorConfirmDoctorsState)
          {
            myToast(msg: state.message, state: ToastStates.ERROR);
          }

          if(state is SuccessRejectDoctorsState)
          {
            myToast(msg: state.message, state: ToastStates.SUCCESS);
          }
          else if(state is ErrorRejectDoctorsState)
          {
            myToast(msg: state.message, state: ToastStates.ERROR);
          }
        },
        builder: (context, state)
        {
          AppColors colors = AppColors(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
              child:
              AppCubit.get(context).pendingDoctors == null
                  ?
                  Center(
                    child: CircularProgressIndicator(color: mainColor,),
                  )
                  :
              RefreshIndicator(
                onRefresh: ()async
                {
                  await AppCubit.get(context).getPending(isReferesh: true);
                },
                child: ListView.separated(
                  itemBuilder: ((context, index) => buildRequestItems(context,AppCubit.get(context).pendingDoctors!.pendingData[index],colors)),
                  separatorBuilder: ((context, index) => SizedBox(
                    height: 10,
                  )),
                  itemCount: AppCubit.get(context).pendingDoctors!.pendingData.length,
                ),
              ),
            ),
          );
        },
    );
  }

  Widget buildRequestItems(BuildContext context,PendingData model,AppColors colors) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.post_background_color(),
            borderRadius: BorderRadiusDirectional.circular(30),
          ),
          child: Column(
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
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        model.name!,
                        style: TextStyle(
                          color: colors.fontColor(),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                   Text(
                     intl.DateFormat('yyyy/MM/dd').format(intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)),
                    style: TextStyle(color: colors.fontColor(), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: ()
                  {
                    ///open CV here !!
                    // model.cv!
                    navTo(context, Pdf_Viewer_Screen(cvLink: model.cv!));
                  },
                  child: Text(
                    'فتح ملف تعريف الهوية',
                    style: TextStyle(color: mainColor,fontWeight: FontWeight.bold, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                [

                  defaultElevatedButton(
                    text: 'قبول',
                    onPressed: ()
                    {
                      AppCubit.get(context).confirmDoctor(model);
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),

                  defaultElevatedButton(
                    text: 'رفض',
                    onPressed: ()
                    {
                      AppCubit.get(context).rejectDoctor(model);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
