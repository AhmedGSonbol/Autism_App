// ignore_for_file: prefer_const_constructors

import 'package:autism/Models/messages_Model.dart';
import 'package:autism/Models/messengers_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl ;

class Chat_Details_Screen extends StatelessWidget {
   Chat_Details_Screen({ required this.messengerModel });

  MessengersData messengerModel;


  @override
  Widget build(BuildContext context)
  {



    var messageController = TextEditingController();

    ScrollController scrollController = ScrollController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
          if(state is SuccessGetNewMessagesState || state is ErrorGetNewMessagesState || state is SuccessGetUserMessagesState)
          {
            if(AppCubit.get(context).messages_model?.messagesData != null && AppCubit.get(context).messages_model!.messagesData.isNotEmpty)
            {
              Future.delayed(Duration(milliseconds: 350),() {
                scrollController.animateTo(scrollController.position.maxScrollExtent  +70, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
              },);
            }
            // scrollController.animateTo(scrollController.position.maxScrollExtent  +80, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
          }
        },
        builder: (context, state)
        {
          var cubit = AppCubit.get(context);
          AppColors colors = AppColors(context);

          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [

                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        messengerModel.name!,
                        style: TextStyle(color: colors.fontColor()),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Hero(
                      tag: '${messengerModel.uId!}_image',
                      child: myImageProvider(messengerModel.image , size: 40.0)
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_forward),
                    color:  colors.fontColor(),
                  ),
                ],
              ),
              leading: SizedBox(),
              titleSpacing: 0.0,
            ),
            body: Column(
              children: [
                Expanded(
                    child:
                    (() {
                      if (cubit.messages_model == null) {
                        return Center(
                          child: CircularProgressIndicator(color: mainColor,),
                        );
                      }
                      else if (cubit.messages_model != null &&
                          cubit.messages_model!.messagesData.isEmpty) {
                        return Center(
                          child: Text('لا يوجد رسائل !',
                            style: TextStyle(color: colors.fontColor()),),
                        );
                      } else
                      {
                        return ListView.builder(
                          controller: scrollController,
                          itemBuilder: (context, index)
                          {
                            bool showTimeOnly = false;

                            if(DateTime.now().difference( intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(cubit.messages_model!.messagesData[index].date!)).inHours < 24)
                            {
                              showTimeOnly = true;
                            }
                            else
                            {
                              showTimeOnly = false;
                            }

                            if(cubit.messages_model!.messagesData[index].isMyMessage!)
                            {
                              return myMessageItemBuilder(cubit.messages_model!.messagesData[index],showTimeOnly,colors);
                            }
                            else
                            {
                              return receiverMessageItemBuilder(cubit.messages_model!.messagesData[index],showTimeOnly,colors);
                            }
                          },
                          itemCount: cubit.messages_model!.messagesData.length,
                        );
                      }
                    }())


                ),

                ///send message section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FocusScope(
                    child: Focus(
                      onFocusChange: (focus)
                      {
                        if(cubit.messages_model?.messagesData != null && cubit.messages_model!.messagesData.isNotEmpty)
                        {
                          Future.delayed(Duration(milliseconds: 350),() {
                            scrollController.animateTo(scrollController.position.maxScrollExtent  +70, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
                          },);
                        }


                      },
                      child: TextField(

                        controller: messageController,
                        maxLines: 1,
                        style: TextStyle(color: colors.fontColor()),
                        decoration: InputDecoration(

                            hintTextDirection: TextDirection.rtl,
                            hintText: 'اكتب شيئا هنا',
                            hintStyle: TextStyle(color: colors.fontColor()),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixIcon: IconButton(
                              onPressed: ()
                              {
                                if(messageController.text.isNotEmpty)
                                {
                                  cubit.sendMessage(messageController.text , messengerModel);
                                  messageController.clear();
                                }
                              },
                              icon: Icon(
                                Icons.send_rounded,
                                color: colors.fontColor(),
                              ),
                            ),
                            fillColor: colors.backgroundColor(),
                            filled: true,

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: colors.fontColor(),
                                )),
                            hoverColor: mainColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

        },
      ),
    );
  }

  Widget receiverMessageItemBuilder(MessagesData model,bool showTimeOnly,AppColors colors) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints:  BoxConstraints(
                minWidth: 70.0,
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(left: 15.0,top: 15.0),
                decoration: BoxDecoration(
                 color: colors.home_drawer_item_background(),
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16),
                    bottomEnd: Radius.circular(16),
                    bottomStart: Radius.circular(16),
                  ),
                ),
                child: Text(
                  model.message!,
                  style: TextStyle(
                    color: colors.fontColor(),
                  ),
                ),
              ),
            ),


            Text(intl.DateFormat(showTimeOnly == true ? 'hh:mm a' : 'yy/M/d').format(intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)),
              style: TextStyle(color: colors.fontColor(),fontSize: 10.0),)

          ],
        ),
      ),
    );
  }

  Widget myMessageItemBuilder(MessagesData model, bool showTimeOnly,AppColors colors)
  {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints:  BoxConstraints(
                minWidth: 70.0,
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(right: 15.0,top: 15),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(16),
                    bottomEnd: Radius.circular(16),
                    bottomStart: Radius.circular(16),
                  ),
                ),
                child: Text(
                  model.message!,
                  style: TextStyle(
                    color: model.status == true ? Color(0xffE1E2E9) : Colors.red,
                  ),
                ),
              ),
            ),

            Text(intl.DateFormat(showTimeOnly == true ? 'hh:mm a' : 'yy/M/d').format(intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)),
              style: TextStyle(color: colors.fontColor(),fontSize: 10.0),)

          ],
        ),
      ),
    );
  }
}
