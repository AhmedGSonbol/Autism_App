import 'dart:math';

import 'package:autism/Models/post_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts_Screen extends StatelessWidget
{
  Posts_Screen({super.key});

  TextEditingController writeCon = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    var postContentController = TextEditingController();

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var la = S.of(context);
        var cubit = AppCubit.get(context);
        AppColors colors = AppColors(context);

        return Padding(
          padding: const EdgeInsetsDirectional.all(10.0),
          child:
          cubit.usersPostsModel == null || cubit.usersPostsModel == null
              ?
          Center(child: CircularProgressIndicator())
              :
          Column(
            children: [
              if(userType == 'patient')
                SizedBox(
                // padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                height: 60,
                child: TextField(
                  controller: postContentController,
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
                          if(postContentController.text.isNotEmpty)
                          {
                            cubit.addPost(type: '',content: postContentController.text);
                            postContentController.clear();
                          }
                          else
                          {
                            myToast(msg: la.postContent, state: ToastStates.WARNING);
                          }

                        },
                      )
                  ),
                ),
              ),
              if(userType == 'patient')
                const SizedBox(
                height: 10,
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: ()async
                  {
                    await cubit.getPatientsPosts();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, index) => bulidPostItem(
                        context: context,
                        model: cubit.usersPostsModel!.postData[index])
                    ,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: cubit.usersPostsModel!.postData.length,
                  ),
                ),
              ),
            ],
          ),
        );

      },
    );
  }
}

