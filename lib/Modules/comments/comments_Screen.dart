import 'dart:math';

import 'package:autism/Models/comments_Model.dart';
import 'package:autism/Models/post_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:autism/generated/l10n.dart';
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
    var la = S.of(context);
    var commentContentController = TextEditingController();

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
        if(state is SuccessAddCommentState)
        {
          myToast(msg: la.SuccessAddComment, state: ToastStates.SUCCESS);
        }
        if(state is SuccessDeleteCommentState)
        {
          myToast(msg: la.SuccessDeleteComment, state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);
        AppColors colors = AppColors(context);

        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title:  Text(la.comments,

                ),
                leading: IconButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: colors.fontColor(),
                ),
              ),
              body: Stack(
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
                                child: Text(la.noComments,style: TextStyle(color: colors.fontColor()),),
                              );
                            }else
                            {
                              return ListView.separated(
                                  padding: EdgeInsets.only(bottom: 70.0),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => bulidCommentItem(
                                    la: la,
                                    colors: colors,
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
                        color: colors.backgroundColor(),
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextField(
                          controller: commentContentController,
                          style:  TextStyle(color: colors.fontColor()),
                          decoration: InputDecoration(

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: colors.fontColor())
                              ),
                              hintText: la.writeSomethingHere,

                              suffixIcon: IconButton(
                                icon: Transform.rotate(
                                  angle: 0,
                                  child:  Icon(Icons.send,color: colors.fontColor(),),
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
                                    myToast(msg: la.enterCommentText, state: ToastStates.WARNING);
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
    required AppColors colors,
    required S la
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.post_background_color(),
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myImageProvider(model.image!),
                  // IconButton(
                  //
                  //   icon: CircleAvatar(
                  //     backgroundImage: (()
                  //     {
                  //       if (model.image != null && model.image!.isNotEmpty)
                  //       {
                  //
                  //         return NetworkImage(model.image!) as ImageProvider;
                  //
                  //       }
                  //       else
                  //       {
                  //         return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                  //       }
                  //     }()),
                  //   )
                  //   ,
                  //   onPressed: () {
                  //     // go to user porofile
                  //   },
                  // ),
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
                                    style: TextStyle(
                                        color: colors.fontColor(),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    // DateTime.parse(model.date!).toString(),
                                    intl.DateFormat('E, yyyy/MM/dd  hh:mm a').format(intl.DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(model.date!)),
                                    style:  TextStyle(
                                      fontSize: 10,
                                      color: colors.fontColor(),
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
                                  color: mainColor,
                                ),

                                onPressed: () {

                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor:
                                        colors.home_drawer_background_color(),
                                        title:  Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete,
                                                color: mainColor,
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Text(
                                                la.sureToDeleteComment,
                                                style: TextStyle(
                                                    fontSize: 25.0,
                                                    color: colors.fontColor()),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child:  Text(
                                              la.delete,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: mainColor
                                              ),
                                            ),
                                            onPressed: ()
                                            {
                                              /// delete comment
                                              AppCubit.get(context).deleteComment(model: model,postID: postModel.id!);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child:  Text(
                                              la.cancelButton,
                                              style:
                                              TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: colors.fontColor()
                                              ),
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
                                style:  TextStyle(
                                  fontSize: 15,
                                  color: colors.fontColor(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trimLines: 2,
                                colorClickableText: mainColor,
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

