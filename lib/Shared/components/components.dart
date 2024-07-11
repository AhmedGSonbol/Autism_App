// ignore_for_file: prefer_const_constructors, unnecessary_import, body_might_complete_normally_nullable

import 'package:autism/Models/post_Model.dart';
import 'package:autism/Modules/comments/comments_Screen.dart';
import 'package:autism/Modules/profile/profile_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:autism/generated/l10n.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as intl ;
import 'package:readmore/readmore.dart';


void navTo(BuildContext context, Widget route) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navAndFinishTo(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String?)? onSaved,
  required BuildContext context,
  String? label,
  bool isPass = false,
  Widget? iconButton,
  // delete validate
  String? Function(String?)? validate,
  prefixPressed,
  Color? prefixColor,
  double? prefixIconSize,
  onTap,
  void Function(String)? onFieldSubmitted,
  bool isClickable = true,
  // IconData? suffix
  TextStyle? style,
  String? hint,
  TextDirection? hintRt1 = TextDirection.rtl,
  TextStyle? hintStyle,
  Widget? prefixIcon,
  int maxLines = 1,
  GlobalKey<FormState>? formKey,
})
{
  AppColors colors = AppColors(context);

  return Directionality(
    textDirection: hintRt1!,
    child: TextFormField(

      key: formKey,
      onSaved: onSaved,
      maxLines: maxLines,
      controller: controller,
      keyboardType: type,
      obscureText: isPass,
      enabled: isClickable,
      onFieldSubmitted: onFieldSubmitted,

      // onChanged: (value) { },

      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: colors.fontColor(),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: colors.fontColor(),
          ),
        ),
        labelText: hint,
        labelStyle:  TextStyle(
            color: colors.fontColor(),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        hintStyle:  TextStyle(color: colors.fontColor(), fontSize: 18),
        suffixIcon: iconButton,
      ),
      onTap: onTap,
      validator: validate ?? (value) {
        if (value == '') {
          return 'مطلوب*';
        }
      },
      style:  TextStyle(color: colors.fontColor()),
    ),
  );
}

//  hintTextDirection: TextDirection.rtl,
//  hintText: 'الإيميل',

// hintStyle:
// TextStyle(color: Color(0xffD9D9D9), fontFamily: 'Roboto'),

Widget defaultButton({
  double width = 100,
  Color color = mainColor,
  double radius = 0.0,
  double height = 40,
  bool isUpperCase = true,
  required String text,
  required void Function()? function,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget defaultElevatedButton({
  double elevation = 0,
  double width = 110,
  double height = 30,
  required void Function() onPressed,
  required String text,
  Color? color ,
  Color? textColor = Colors.white,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(elevation),
        fixedSize: MaterialStateProperty.all<Size>(
           Size(width, height), // Set the desired width and height
        ),
        backgroundColor: MaterialStatePropertyAll(
          color ?? mainColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textColor ?? const Color(0xff05305F),
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
    );

//////////////////////////////////////////////////////////

Widget bulidPostItem({
  required BuildContext context,
  required PostData model,
  bool enableOpenProfile = true,
})
{
  AppColors colors = AppColors(context);
  var la = S.of(context);

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
                IconButton(

                  icon: myImageProvider(model.image)
                  ,
                  onPressed: ()
                  {
                    // go to user porofile

                    if(enableOpenProfile)
                    {
                      if(AppCubit.get(context).userModel!.data!.id != model.post_user_id!)
                      {
                        AppCubit.get(context).getUserData(userID: model.post_user_id!);
                        navTo(context, Profile_Screen(isView: true));
                      }
                      else
                      {

                        navTo(context, Profile_Screen(isView: false));
                      }
                    }




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
                                  style: TextStyle(
                                    color: colors.fontColor(),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  intl.DateFormat('E, yyyy/MM/dd  hh:mm a').format(intl.DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'",'en').parse(model.date!)),
                                  style:  TextStyle(
                                    fontSize: 10,
                                    color: colors.fontColor(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: model.post_user_id == AppCubit.get(context).userModel!.data!.id
                                      ? const Icon(
                                          Icons.delete_outline,
                                          color: secondColor,
                                        )
                                      : const Icon(
                                    Icons.error_outline,
                                    color: secondColor,
                                  ),
                                  onPressed: () {
                                    if (!(model.post_user_id == AppCubit.get(context).userModel!.data!.id)) {
                                      showDialog(
                                        context: context,
                                        builder: (context)
                                        {

                                          bool checkIncorrect = false;
                                          bool checkInsult = false;
                                          bool checkAnnoying = false;

                                          return StatefulBuilder(
                                            builder: (context, setState)
                                            {

                                              return AlertDialog(
                                                backgroundColor: colors.home_drawer_background_color(),
                                                title: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.error_outline,
                                                        color: secondColor,
                                                      ),
                                                      const SizedBox(
                                                        height: 20.0,
                                                      ),
                                                       Text(
                                                        la.report,
                                                        style: TextStyle(
                                                            fontSize: 25.0,
                                                            color: colors.fontColor()),
                                                      ),
                                                      const SizedBox(
                                                        height: 20.0,
                                                      ),
                                                       Text(
                                                          la.reportKind,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 17.0,
                                                            color: colors.fontColor()
                                                          ),
                                                       )
                                                    ],
                                                  ),
                                                ),
                                                content: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            checkColor: Colors.white,
                                                            activeColor: mainColor,
                                                            value: checkIncorrect,
                                                            onChanged: (val)
                                                            {
                                                              setState(() => checkIncorrect = !checkIncorrect);
                                                            }),
                                                        const Spacer(),
                                                        Text(
                                                          la.incorrectInfo,
                                                          style: TextStyle(
                                                              fontSize: 17.0,
                                                              color: colors.fontColor()
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            checkColor: Colors.white,
                                                            activeColor: mainColor,
                                                            value: checkInsult,
                                                            onChanged: (val)
                                                            {
                                                              setState(() => checkInsult = !checkInsult);

                                                            }),
                                                        const Spacer(),
                                                        Text(la.VerbalAbuse,
                                                          style: TextStyle(
                                                              fontSize: 17.0,
                                                              color: colors.fontColor()
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            checkColor: Colors.white,
                                                            activeColor: mainColor,
                                                            value: checkAnnoying,
                                                            onChanged: (val)
                                                            {
                                                              setState(() => checkAnnoying = !checkAnnoying);
                                                            }),
                                                        const Spacer(),
                                                        Text(la.annoying,
                                                          style: TextStyle(
                                                              fontSize: 17.0,
                                                              color: colors.fontColor()
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                actions: [
                                                  TextButton(
                                                    child: Text(
                                                      la.send,
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight: FontWeight.bold,
                                                          color: mainColor
                                                      ),
                                                    ),
                                                    onPressed: ()
                                                    {
                                                      if(checkIncorrect == true || checkInsult == true || checkAnnoying == true)
                                                      {
                                                        List<String> complaintList = [];

                                                        if(checkIncorrect == true)
                                                        {
                                                          complaintList.add(la.incorrectInfo);
                                                        }
                                                        if(checkInsult == true)
                                                        {
                                                          complaintList.add(la.VerbalAbuse);
                                                        }
                                                        if(checkAnnoying == true)
                                                        {
                                                          complaintList.add(la.annoying);
                                                        }


                                                          print(complaintList.join(', '));
                                                        AppCubit.get(context).addReport(model.id!, complaintList.join(', '));
                                                        Navigator.pop(context);
                                                      }
                                                      else
                                                      {
                                                        myToast(msg: la.chooseComplaint, state: ToastStates.WARNING);
                                                      }

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
                                              );

                                            },
                                          );
                                        },
                                      );
                                    } else
                                    {

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
                                                  la.deletePost,
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
                                                AppCubit.get(context).deletePost(model);
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
                                    }
                                  },
                                ),
                                (() {
                                  if (model.type == 'none') {
                                    return Container();
                                  } else {
                                    if (model.type == 'advice') {
                                      return const Icon(
                                        Icons.report_gmailerrorred_rounded,
                                        color: appRedColor,
                                      );
                                    } else if (model.type == 'information') {
                                      return const Icon(
                                        Icons.info_outline,
                                        color: appGreenColor,
                                      );
                                    } else {
                                      return const Icon(
                                        Icons.help_outline,
                                        color: mainColor,
                                      );
                                    }
                                  }
                                }()),
                              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //like button
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        !model.isLiked! ? Icons.favorite_border : Icons.favorite,
                        color: !model.isLiked!
                            ? colors.fontColor()
                            : const Color(0xffE27676),
                      ),
                      onPressed: ()
                      {
                        AppCubit.get(context).likeUnlikePost(model);
                      },
                    ),
                    Text(
                      '${model.likes}',
                      style:  TextStyle(color: colors.fontColor(), fontSize: 15.0),
                    )
                  ],
                ),

                //comment button
                Column(
                  children: [
                    IconButton(
                      icon:  Icon(
                        Icons.comment,
                        color: colors.fontColor(),
                      ),
                      onPressed: () {
                        // Handle comment on post

                        AppCubit.get(context).comments_model = null;

                        AppCubit.get(context).getPostComments(model.id!);

                        navTo(context, Comments_Screen(postModel: model));
                      },
                    ),
                    Text(
                      '${model.comments}',
                      style:  TextStyle(color: colors.fontColor(), fontSize: 15.0),
                    )
                  ],
                ),

                //save button
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        model.isSaved!
                            ? Icons.bookmark_added_outlined
                            : Icons.bookmark_add_outlined,
                        color: model.isSaved!
                            ? const Color(0xFF00d184)
                            : colors.fontColor(),
                      ),
                      onPressed: ()
                      {
                        // Handle save post
                        AppCubit.get(context).saveUnsavePost(model);
                      },
                    ),
                    Text(
                      '${model.saves}',
                      style:  TextStyle(color: colors.fontColor(), fontSize: 15.0),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// Not Used !!
// Widget buildReviewsItem() {
//   return Padding(
//     padding: const EdgeInsetsDirectional.symmetric(
//       horizontal: 20,
//     ),
//     child: Container(
//       height: 155,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xff292A2D),
//         borderRadius: BorderRadiusDirectional.circular(10),
//       ),
//       child: Column(
//         children: [
//           ListTile(
//             leading: const CircleAvatar(
//               backgroundImage: AssetImage('assets/images/Rectangle (5).png'),
//             ),
//             title: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:  [
//                 Text(
//                   'د. أحمد',
//                   style: textOnBoarding2,
//                 ),
//                 const Text(
//                   ' ٢ أكتوبر ٢٠٢٤',
//                   style: TextStyle(
//                     fontSize: 10,
//                     color: fontColor,
//                   ),
//                 ),
//               ],
//             ),
//             subtitle: const Text(
//               'أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ أَبْجَدْ هَوَّزْ',
//               style: TextStyle(fontSize: 15, color: fontColor),
//               overflow: TextOverflow.ellipsis,
//             ),
//             trailing: IconButton(
//               icon: const Icon(Icons.info),
//               onPressed: () {},
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   Icons.favorite,
//                   color: fontColor,
//                 ),
//                 onPressed: () {
//                   // Handle like post
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(
//                   Icons.comment,
//                   color: fontColor,
//                 ),
//                 onPressed: () {
//                   // Handle comment on post
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(
//                   Icons.bookmark_add,
//                   color:  fontColor,
//                 ),
//                 onPressed: () {
//                   // Handle save post
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget myNavBar(BuildContext context,{
  required int selectedIndex,
  required List<String> text,
  required Function(int index) onDestinationSelected,
}){

  AppColors colors = AppColors(context);

  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff8E9199), width: 1.0),
      borderRadius: BorderRadius.circular(31.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: NavigationBar(
            height: 60.0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            // indicatorColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: selectedIndex,
            destinations: text
                .asMap()
                .entries
                .map((entry) => NavigationDestination(
                      icon: Container(
                          decoration: BoxDecoration(
                            color: entry.key == selectedIndex
                                ? mainColor
                                : Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                if (entry.key == selectedIndex)
                                   Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      entry.value,
                                      style: TextStyle(
                                          color: entry.key == selectedIndex
                                              ? Colors.white
                                              : colors.fontColor()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      label: '',
                    ))
                .toList(),
            onDestinationSelected: onDestinationSelected),
      ),
    ),
  );
}

Widget mySwitch() {
  return Switch(
    value: true,
    onChanged: (val) {},
    activeTrackColor: const Color(0xffA8C8FF),
    thumbIcon: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check, color: Color(0xffA8C8FF));
        }
        return null;
      },
    ),
    thumbColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xff05305F);
        }
        return Colors.grey;
      },
    ),
  );
}

void myToast({
  required String msg,
  required ToastStates state,

  Toast toastLength = Toast.LENGTH_LONG,
  ToastGravity gravity = ToastGravity.BOTTOM,
  int timeInSecForIosWeb = 1,
  double fontSize = 16.0,


})
{
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: timeInSecForIosWeb,
    backgroundColor: toastbackgroundColor(state),
    textColor: toastFontColor(state),
    fontSize: fontSize,
  );
}

enum ToastStates {SUCCESS , ERROR , WARNING}

Color toastbackgroundColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;

      break;
  }
  return color;
}

Color toastFontColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.white;
      break;
    case ToastStates.ERROR:
      color = Colors.white;
      break;
    case ToastStates.WARNING:
      color = Colors.black;

      break;
  }
  return color;
}

// Widget myImageProvider(String? link , {double size = 50})
// {
//   if(link == null || link.isEmpty)
//   {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(25.0),
//       child:Image.asset('assets/images/Rectangle.png',fit: BoxFit.cover,isAntiAlias: true,width: size,height: size)
//     );
//   }
//   else
//   {
//     try {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(25.0),
//         child: Image.network(fit: BoxFit.cover,
//           isAntiAlias: true,
//           width: 50.0,
//           height: 50.0,
//           link,
//           errorBuilder: (BuildContext context, Object exception,
//               StackTrace? stackTrace) {
//             return Image.asset('assets/images/Rectangle.png', fit: BoxFit.cover,
//                 isAntiAlias: true,
//                 width: 50.0,
//                 height: 50.0);
//           },
//         ),
//       );
//     }catch(e)
//     {
//       return Image.asset('assets/images/Rectangle.png', fit: BoxFit.cover,
//           isAntiAlias: true,
//           width: 50.0,
//           height: 50.0);
//     }
//   }
//
// }

Widget myImageProvider(String? link , {double size = 50})
{
  link = link ?? '';

  return ClipRRect(
    borderRadius: BorderRadius.circular(100.0),
    child: FancyShimmerImage(
      width: size,
      height: size,
      boxFit: BoxFit.cover,
      alignment: Alignment.centerRight,
      imageUrl: link,
      errorWidget:Image(image: AssetImage('assets/images/Ellipse 18.png'),),
    ),
  );
  if(link == null || link.isEmpty)
  {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child:Image.asset('assets/images/Rectangle.png',fit: BoxFit.cover,isAntiAlias: true,width: size,height: size)
    );
  }
  else
  {
    try {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image.network(fit: BoxFit.cover,
          isAntiAlias: true,
          width: 50.0,
          height: 50.0,
          link,
          errorBuilder: (BuildContext context, Object exception,
              StackTrace? stackTrace) {
            return Image.asset('assets/images/Rectangle.png', fit: BoxFit.cover,
                isAntiAlias: true,
                width: 50.0,
                height: 50.0);
          },
        ),
      );
    }catch(e)
    {
      return Image.asset('assets/images/Rectangle.png', fit: BoxFit.cover,
          isAntiAlias: true,
          width: 50.0,
          height: 50.0);
    }
  }

}