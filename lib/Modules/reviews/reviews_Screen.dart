// ignore_for_file: prefer_const_constructors

import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reviews_Screen extends StatelessWidget {
  const Reviews_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    var postContentController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Padding(
          padding: const EdgeInsetsDirectional.all(10.0),
          child: cubit.usersPostsModel == null || cubit.doctorsPostsModel == null
              ? Center(child: CircularProgressIndicator(color: mainColor,))
              : SingleChildScrollView(
                child: Column(
                    children:
                    [
                      if (userType == 'doctor')
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          height:  cubit.showAddPostStyle ? 200 : 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Color(0xff8E9199), width: .5),
                          ),
                          child: Column(
                            children:
                            [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                [



                                  Flexible(
                                    child: AnimatedCrossFade(
                                      crossFadeState: cubit.showAddPostStyle ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                      duration: Duration(seconds: 1),
                                      firstChild: InkWell(
                                        onTap: ()
                                        {
                                          cubit.changeAddPostStyle();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            children:
                                            const [
                                              Text(
                                                'نشر',
                                                style: TextStyle(
                                                  color: fontColor,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'نصيحة',
                                                style: TextStyle(
                                                    color: Color(0xffFFB4AB),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'أو',
                                                style: TextStyle(
                                                  color: fontColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'معلومة',
                                                style: TextStyle(
                                                    color: Color(0xff61FD7D),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'أو',
                                                style: TextStyle(
                                                  color: fontColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'سؤال',
                                                style: TextStyle(
                                                    color: Color(0xffA8C8FF),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      secondChild: Flexible(

                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 20.0,bottom: 10.0,right: 10.0),
                                          child: TextField(
                                            minLines: 3,
                                            maxLines: 3,
                                            controller: postContentController,
                                            style: const TextStyle(color: Colors.white),
                                            decoration: InputDecoration(

                                                border: InputBorder.none,
                                                focusedBorder:  OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(16),
                                                    borderSide: BorderSide(color: Colors.transparent,width: 0.0)),



                                                label: Row(
                                                  children:
                                                   [
                                                    Text('إكتب'),
                                                    SizedBox(width: 3,),
                                                    (()
                                                    {
                                                      if(cubit.docPostType == 'advice')
                                                      {
                                                        return Text(
                                                          'نصيحة',
                                                          style: TextStyle(
                                                              color: Color(0xffFFB4AB),
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.bold),
                                                        );
                                                      }
                                                      else if(cubit.docPostType == 'information')
                                                      {
                                                        return Text(
                                                        'معلومة',
                                                        style: TextStyle(
                                                      color: Color(0xff61FD7D),
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold),
                                                      );
                                                      }
                                                      else
                                                      {
                                                        return Text(
                                                        'سؤال',
                                                        style: TextStyle(
                                                      color: Color(0xffA8C8FF),
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold),
                                                      );
                                                      }
                                                    }())

                                                  ],
                                                ),
                                                labelStyle: const TextStyle(
                                                  color: Color(0xffE1E2E9),
                                                ),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: AnimatedCrossFade(
                                        crossFadeState: cubit.showAddPostStyle ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                      duration: Duration(seconds: 1),
                                      firstChild: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.report_gmailerrorred_rounded,
                                            color: Color(0xffFFB4AB),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Icon(
                                            Icons.info_outline,
                                            color: Color(0xff16EA9E),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Icon(
                                            Icons.help_outline,
                                            color: Color(0xff569CFF),
                                          ),
                                        ],
                                      ),
                                      secondChild: DropdownButton(
                                        value: cubit.docPostType,
                                        onChanged: (val)
                                        {
                                          cubit.changeDocPostType(val!);
                                        },

                                        items:
                                        const [
                                          DropdownMenuItem(child: Icon(
                                            Icons.report_gmailerrorred_rounded,
                                            color: Color(0xffFFB4AB),
                                          ),
                                            value: 'advice',
                                          ),
                                          DropdownMenuItem(child: Icon(
                                            Icons.info_outline,
                                            color: Color(0xff16EA9E),
                                          ),
                                            value: 'information',
                                          ),
                                          DropdownMenuItem(child: Icon(
                                            Icons.help_outline,
                                            color: Color(0xff569CFF),
                                          ),
                                            value: 'question',
                                          ),
                                        ],
                                        dropdownColor: backgroundColor,

                                      )
                                    ),
                                  ),
                                ],
                              ),


                              AnimatedCrossFade(
                                crossFadeState: cubit.showAddPostStyle ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                duration: Duration(seconds: 1),
                                firstChild: SizedBox(),
                                secondChild: ElevatedButton(

                                  child: Text('نشر',style: TextStyle(color: Colors.black , fontSize: 15.0),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor,
                                    ),


                                    onPressed: ()
                                    {

                                      if(postContentController.text.isNotEmpty)
                                      {
                                        cubit.addPost(
                                            type: cubit.docPostType,
                                            content: postContentController.text);
                                        postContentController.clear();
                                      }
                                      else
                                      {
                                        myToast(msg: 'برجاء كتابة نص للمنشور !', state: ToastStates.WARNING);
                                      }
                                    },

                                ),
                              )
                            ],
                          ),
                        ),
                      if (userType == 'doctor')
                        const SizedBox(
                          height: 10,
                        ),
                      // if (userType == 'doctor')
                      //   SizedBox(
                      //     // padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                      //     height: 60,
                      //     child: TextField(
                      //       style: const TextStyle(color: Colors.white),
                      //       decoration: InputDecoration(
                      //           border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(16)),
                      //           hintText: 'إكتب شئ',
                      //           hintStyle: const TextStyle(
                      //             color: Color(0xffE1E2E9),
                      //           ),
                      //           suffixIcon: IconButton(
                      //             icon: Transform.rotate(
                      //               angle: 0,
                      //               child: const Icon(
                      //                 Icons.send,
                      //                 color: fontColor,
                      //               ),
                      //             ),
                      //             onPressed: () {},
                      //           )),
                      //     ),
                      //   ),
                      if (userType == 'doctor')
                        const SizedBox(
                          height: 10,
                        ),
                      ListView.separated(

                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => bulidPostItem(
                            context: context,
                            model: cubit.doctorsPostsModel!.postData[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: cubit.doctorsPostsModel!.postData.length,
                      ),
                    ],
                  ),
              ),
        );
      },
    );
  }
}
