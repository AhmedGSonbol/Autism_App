// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:autism/Models/messengers_Model.dart';
import 'package:autism/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl ;

class Chat_Screen extends StatelessWidget
{
  const Chat_Screen({super.key});



  @override
  Widget build(BuildContext context)
  {


    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          AppColors colors = AppColors(context);


          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
              child:
              (()
              {
                if(cubit.messengers_model == null)
                {
                  return Center(
                    child: CircularProgressIndicator(color: mainColor,),
                  );
                }
                else if(cubit.messengers_model != null && cubit.messengers_model!.messengersData.length == 0)
                {
                  return Center(
                    child: Text('لا يوجد محادثات !',style: TextStyle(color: colors.fontColor()),),
                  );
                }else
                {
                  return ListView.separated(
                    itemBuilder: ((context, index) => buildChatItems(context,cubit.messengers_model!.messengersData[index],colors)),
                    separatorBuilder: ((context, index) => SizedBox(
                      height: 10,
                    )),
                    itemCount: cubit.messengers_model!.messengersData.length,
                  );
                }
              }())

            ),
          );

        },);
  }

  Widget buildChatItems(BuildContext context , MessengersData model, AppColors colors)
  {
    bool showTimeOnly;

    if(DateTime.now().difference( intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)).inHours < 24)
    {
      showTimeOnly = true;
    }
    else
    {
      showTimeOnly = false;
    }

    return InkWell(
      onTap: ()
      {
        AppCubit.get(context).getUserMessages(model.uId!);
        navTo(context, Chat_Details_Screen(messengerModel: model,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.post_background_color(),
            borderRadius: BorderRadiusDirectional.circular(16),
          ),
          child: Column(
            children:
            [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Hero(
                        tag: '${model.uId!}_image',
                        child: myImageProvider(model.image)
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          model.name!,
                          style: TextStyle(
                              color: colors.fontColor(),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Text(
                      intl.DateFormat(showTimeOnly == true ? 'hh:mm a' : 'yy/M/d').format(intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)),
                      style: TextStyle(color: colors.fontColor(), fontSize: 15 ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          model.message!,
                          style: TextStyle(color: colors.fontColor(), fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsetsDirectional.only(end: 20),
              //         child: Container(
              //           height: 30,
              //           width: 30,
              //           decoration: const BoxDecoration(
              //               shape: BoxShape.circle, color: Color(0xffA8C8FF)),
              //           child: const Center(
              //             child: Text(
              //               '٢',
              //               style: TextStyle(
              //                   color: Color(0xff05305F),
              //                   fontSize: 20,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );

  }
}
