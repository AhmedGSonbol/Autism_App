import 'dart:math';

import 'package:autism/Models/comments_Model.dart';
import 'package:autism/Models/post_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:readmore/readmore.dart';

class Comments_Screen extends StatelessWidget
{
  Comments_Screen({super.key,required this.postModel});

  PostData postModel;

  @override
  Widget build(BuildContext context)
  {
    var commentContentController = TextEditingController();

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
        if(state is SuccessAddCommentState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
        }
        if(state is SuccessDeleteCommentState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);

        return Stack(
          children: [
            Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                scrolledUnderElevation: 0,
                elevation: 0,
                backgroundColor: const Color(0xff292A2D),
                title:  Text('التعليقات',
                  style: TextStyle(color: fontColor),
                ),
                leading: IconButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: fontColor,
                ),
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10.0),
                      child:
                      cubit.usersPostsModel == null
                          ?
                      Center(child: CircularProgressIndicator())
                          :
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children:
                          [
                            // RefreshIndicator(
                            //   onRefresh: ()async
                            //   {
                            //     // refresh comments
                            //     // await cubit.getPatientsPosts();
                            //   },
                            //   child:
                            // ),

                            bulidPostItem(
                                context: context,
                                model: postModel),

                            SizedBox(height: 30,),

                            (()
                            {
                              if(cubit.comments_model == null)
                              {
                                return Center(
                                  child: CircularProgressIndicator(color: mainColor,),
                                );
                              }
                              else if(cubit.comments_model != null && cubit.comments_model!.commentsData.length == 0)
                              {
                                return Center(
                                  child: Text('لا يوجد تعليقات !',style: TextStyle(color: fontColor),),
                                );
                              }else
                              {
                                return ListView.separated(
                                    padding: EdgeInsets.only(bottom: 70.0),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => bulidCommentItem(
                                        context: context,
                                        model: cubit.comments_model!.commentsData[index]),
                                    separatorBuilder: (context, index) => SizedBox(height: 5,),
                                    itemCount: cubit.comments_model!.commentsData.length
                                );
                              }
                            }())





                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0,top: 5.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: backgroundColor,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: commentContentController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                hintText: 'إكتب شئ',
                                hintStyle: const TextStyle(
                                  color: Color(0xffE1E2E9),
                                ),
                                suffixIcon: IconButton(
                                  icon: Transform.rotate(
                                    angle: 0,
                                    child: const Icon(Icons.send,color: fontColor,),
                                  ),
                                  onPressed: ()
                                  {
                                    if(commentContentController.text.isNotEmpty)
                                    {
                                      cubit.addComment(postID: postModel.id!,content: commentContentController.text);
                                      commentContentController.clear();
                                    }
                                    else
                                    {
                                      myToast(msg: 'برجاء كتابة نص للتعليق !', state: ToastStates.WARNING);
                                    }

                                  },
                                )
                            ),
                          ),
                        ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


            if(state is LoadingAddCommentState ||
                state is LoadingDeleteCommentState)
              Positioned.fill(
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(color: mainColor,),
                  ),
                ),
              ),
          ],
        );

      },
    );
  }

  Widget bulidCommentItem({
    required BuildContext context,
    required CommentsData model,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff292A2D),
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(

                    icon: CircleAvatar(
                      backgroundImage: (()
                      {
                        if (model.image != null && model.image!.isNotEmpty)
                        {

                          return NetworkImage(model.image!) as ImageProvider;

                        }
                        else
                        {
                          return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                        }
                      }()),
                    )
                    ,
                    onPressed: () {
                      // go to user porofile
                    },
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.name!,
                                    style: onBoardingDesc,
                                  ),
                                  Text(
                                    // DateTime.parse(model.date!).toString(),
                                    intl.DateFormat('E, yyyy/MM/dd  hh:mm a').format(intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: fontColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if( model.is_my_comment!)
                              Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child:IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Color(0xffDBBCE1),
                                ),

                                onPressed: () {

                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor:
                                        const Color(0xff282a2f),
                                        title:  Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete,
                                                color: secondColor,
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Text(
                                                'هل تريد حذف التعليق ؟',
                                                style: TextStyle(
                                                    fontSize: 25.0,
                                                    color: fontColor),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text(
                                              'حذف',
                                              style: TextStyle(
                                                  color: secondColor),
                                            ),
                                            onPressed: ()
                                            {
                                              /// delete comment
                                              AppCubit.get(context).deleteComment(model: model,postID: postModel.id!);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: const Text(
                                              'إلغاء',
                                              style:
                                              TextStyle(color: fontColor),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],

                                        // backgroundColor: backgroundColor,
                                        titlePadding: EdgeInsets.zero,
                                      ),
                                    );

                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ReadMoreText(
                                model.content!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: fontColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trimLines: 2,
                                colorClickableText: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


}

