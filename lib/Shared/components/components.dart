// ignore_for_file: prefer_const_constructors, unnecessary_import, body_might_complete_normally_nullable

import 'package:autism/Models/post_Model.dart';
import 'package:autism/Modules/comments/comments_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
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
  String? label,
  bool isPass = false,
  Widget? iconButton,
  // delete validate
  String? Function(String?)? validate,
  prefixPressed,
  Color? prefixColor,
  double? prefixIconSize,
  onTap,
  bool isClickable = true,
  // IconData? suffix
  TextStyle? style,
  String? hint,
  TextDirection? hintRt1 = TextDirection.rtl,
  TextStyle? hintStyle,
  Widget? prefixIcon,
  int maxLines = 1,
  GlobalKey<FormState>? formKey,
}) {
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
      onFieldSubmitted: (value) {},

      // onChanged: (value) { },

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffA8C8FF),
          ),
        ),
        labelText: hint,
        labelStyle: const TextStyle(
            color: Color(0xffD9D9D9),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        hintStyle: const TextStyle(color: Color(0xffD9D9D9), fontSize: 18),
        suffixIcon: iconButton,
      ),
      onTap: onTap,
      validator: validate ?? (value) {
        if (value == '') {
          return 'مطلوب*';
        }
      },
      style: const TextStyle(color: Colors.white),
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
            color: Color(0xff05305F),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget defaultElevatedButton({
  double elevation = 0,
  double width = 100,
  double height = 50,
  required void Function() onPressed,
  required String text,
  Color? color,
  Color? textColor,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(elevation),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(90, 30), // Set the desired width and height
        ),
        backgroundColor: MaterialStatePropertyAll(
          color ?? const Color(0xffA8C8FF),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: model.post_user_id == AppCubit.get(context).userModel!.data!.id
                                      ? const Icon(
                                          Icons.delete_outline,
                                          color: Color(0xffDBBCE1),
                                        )
                                      : Image.asset(
                                          'assets/images/partner_reports.png'),
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
                                                backgroundColor:
                                                const Color(0xff282a2f),
                                                title: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/partner_reports.png',
                                                        height: 20.0,
                                                        width: 20.0,
                                                      ),
                                                      const SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      const Text(
                                                        'إبلاغ',
                                                        style: TextStyle(
                                                            fontSize: 25.0,
                                                            color: fontColor),
                                                      ),
                                                      const SizedBox(
                                                        height: 20.0,
                                                      ),
                                                      const Text(
                                                          'حدد نوع الإساءة الموجودة في المنشور',
                                                          textAlign: TextAlign.center,
                                                          style: onBoardingDesc)
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
                                                            checkColor: Colors.black,
                                                            activeColor: mainColor,
                                                            value: checkIncorrect,
                                                            onChanged: (val)
                                                            {
                                                              setState(() => checkIncorrect = !checkIncorrect);
                                                            }),
                                                        const Spacer(),
                                                        Text(
                                                          'معلومة غير صحيحة',
                                                          style: onBoardingDesc,
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            checkColor: Colors.black,
                                                            activeColor: mainColor,
                                                            value: checkInsult,
                                                            onChanged: (val)
                                                            {
                                                              setState(() => checkInsult = !checkInsult);

                                                            }),
                                                        const Spacer(),
                                                        Text('إساءة باللفظ',
                                                            style: onBoardingDesc),
                                                      ],
                                                    ),
                                                    const Divider(),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            checkColor: Colors.black,
                                                            activeColor: mainColor,
                                                            value: checkAnnoying,
                                                            onChanged: (val)
                                                            {
                                                              setState(() => checkAnnoying = !checkAnnoying);
                                                            }),
                                                        const Spacer(),
                                                        Text('إزعاج',
                                                            style: onBoardingDesc),
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                actions: [
                                                  TextButton(
                                                    child: const Text(
                                                      'إرسال',
                                                      style: TextStyle(
                                                          color: secondColor),
                                                    ),
                                                    onPressed: ()
                                                    {
                                                      if(checkIncorrect == true || checkInsult == true || checkAnnoying == true)
                                                      {
                                                        List<String> complaintList = [];

                                                        if(checkIncorrect == true)
                                                        {
                                                          complaintList.add('معلومة غير صحيحة');
                                                        }
                                                        if(checkInsult == true)
                                                        {
                                                          complaintList.add('إساءة باللفظ');
                                                        }
                                                        if(checkAnnoying == true)
                                                        {
                                                          complaintList.add('إزعاج');
                                                        }


                                                          print(complaintList.join(', '));
                                                        AppCubit.get(context).addReport(model.id!, complaintList.join(', '));
                                                        Navigator.pop(context);
                                                      }
                                                      else
                                                      {
                                                        myToast(msg: 'برجاء اختيار الشكوي !', state: ToastStates.WARNING);
                                                      }

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
                                              );

                                            },
                                          );
                                        },
                                      );
                                    } else {
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
                                                  'هل تريد حذف المنشور ؟',
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
                                                AppCubit.get(context).deletePost(model);
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
                                        color: Color(0xFFFFB4AB),
                                      );
                                    } else if (model.type == 'information') {
                                      return const Icon(
                                        Icons.info_outline,
                                        color: Color(0xFF16EA9E),
                                      );
                                    } else {
                                      return const Icon(
                                        Icons.help_outline,
                                        color: Color(0xFF569CFF),
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
                            ? fontColor
                            : const Color(0xffE27676),
                      ),
                      onPressed: ()
                      {
                        AppCubit.get(context).likeUnlikePost(model);
                      },
                    ),
                    Text(
                      '${model.likes}',
                      style: const TextStyle(color: fontColor, fontSize: 15.0),
                    )
                  ],
                ),

                //comment button
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.comment,
                        color: fontColor,
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
                      style: const TextStyle(color: fontColor, fontSize: 15.0),
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
                            ? const Color(0xff16EA9E)
                            : fontColor,
                      ),
                      onPressed: ()
                      {
                        // Handle save post
                        AppCubit.get(context).saveUnsavePost(model);
                      },
                    ),
                    Text(
                      '${model.saves}',
                      style: const TextStyle(color: fontColor, fontSize: 15.0),
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

Widget myNavBar({
  required int selectedIndex,
  required List<String> text,
  required Function(int index) onDestinationSelected,
}) {
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
                                  const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 18.0,
                                  ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      entry.value,
                                      style: TextStyle(
                                          color: entry.key == selectedIndex
                                              ? Colors.black
                                              : fontColor),
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

Widget myImageProvider(String? link , {double size = 50})
{
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
