// ignore_for_file: prefer_const_constructors, unnecessary_import, body_might_complete_normally_nullable

import 'package:autism/Models/post_Model.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  String? label,
  bool isPass = false,
  Widget? iconButton,
  // delete validate
  validate,
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
}) {
  return Directionality(
    textDirection: hintRt1!,
    child: TextFormField(
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
        labelText: label,
        labelStyle: const TextStyle(
            color: Color(0xffD9D9D9),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xffD9D9D9), fontSize: 18),
        suffixIcon: iconButton,
      ),
      onTap: onTap,
      validator: (value) {
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
  required Post_Model model,
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
                  // change it to network image
                  icon: Image(image: AssetImage(model.avatarImage!)),
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
                                  model.date!,
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
                                  icon: model.uId! == uId
                                      ? const Icon(
                                          Icons.delete_outline,
                                          color: Color(0xffDBBCE1),
                                        )
                                      : Image.asset(
                                          'assets/images/partner_reports.png'),
                                  onPressed: () {
                                    if (!(model.uId == uId)) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
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
                                                      activeColor: mainColor,
                                                      value: true,
                                                      onChanged: (val) {}),
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
                                                      activeColor: mainColor,
                                                      value: false,
                                                      onChanged: (val) {}),
                                                  const Spacer(),
                                                  Text('إساءة باللفظ',
                                                      style: onBoardingDesc),
                                                ],
                                              ),
                                              const Divider(),
                                              Row(
                                                children: [
                                                  Checkbox(
                                                      activeColor: mainColor,
                                                      value: true,
                                                      onChanged: (val) {}),
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
                                              onPressed: () {},
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
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor:
                                              const Color(0xff282a2f),
                                          title: const Padding(
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
                                              onPressed: () {},
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
                                  if (model.postType == 0) {
                                    return Container();
                                  } else {
                                    if (model.postType == 1) {
                                      return const Icon(
                                        Icons.report_gmailerrorred_rounded,
                                        color: Color(0xFFFFB4AB),
                                      );
                                    } else if (model.postType == 2) {
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
                              model.text!,
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
                        model.isSaved! ? Icons.favorite_border : Icons.favorite,
                        color: model.isSaved!
                            ? fontColor
                            : const Color(0xffE27676),
                      ),
                      onPressed: () {
                        // Handle like post
                      },
                    ),
                    Text(
                      '${model.likesCount}',
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
                      },
                    ),
                    Text(
                      '${model.commentsCount}',
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
                      onPressed: () {
                        // Handle save post
                      },
                    ),
                    Text(
                      '${model.savesCounts}',
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
      border: Border.all(color: Colors.grey, width: 1.0),
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
            indicatorColor: Colors.transparent,
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



// AnimatedSwitcher buildAnimatedSwitcher(
//   BuildContext context, {
//   required value1,
//   required value2,
//   required text1,
//   required text2,
//   required bool isExpanded,
//   required Function function1,
//   required Function function2,
//   required width,
//   unPressedBColor,
// }) {
//   return AnimatedSwitcher(
//     duration: const Duration(seconds: 6),
//     child: isExpanded
//         ? Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 500),
//                   child: InkWell(
//                     key: ValueKey<bool>(value1),
//                     onTap: () {
//                       function1();
//                     },
//                     child: Container(
//                       width: screenWidth(context, .4),
//                       decoration: BoxDecoration(
//                         color: value1
//                             ? Colors.blue
//                             : unPressedBColor ??
//                                 const Color.fromRGBO(0, 9, 23, 0.06),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Text(
//                             text1,
//                             style: midTextStyle(
//                               context,
//                               value1 ? Colors.white : Colors.black,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 500),
//                   child: InkWell(
//                     key: ValueKey<bool>(value2),
//                     onTap: () {
//                       function2();
//                     },
//                     child: Container(
//                       width: screenWidth(context, .4),
//                       decoration: BoxDecoration(
//                         color: value2
//                             ? Colors.blue
//                             : unPressedBColor ??
//                                 const Color.fromRGBO(0, 9, 23, 0.06),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Text(
//                             text2,
//                             style: midTextStyle(
//                               context,
//                               value2 ? Colors.white : Colors.black,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         : Row(
//             children: [
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 500),
//                 child: InkWell(
//                   key: ValueKey<bool>(value1),
//                   onTap: () {
//                     function1();
//                   },
//                   child: Container(
//                     width: width,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: value1
//                             ? Colors.blue
//                             : const Color.fromRGBO(186, 186, 186, 1),
//                       ),
//                       color: value1
//                           ? Colors.blue
//                           : unPressedBColor ??
//                               const Color.fromRGBO(0, 9, 23, 0.06),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           text1,
//                           style: midTextStyle(
//                             context,
//                             value1 ? Colors.white : Colors.black,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 20),
//               AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 500),
//                 child: InkWell(
//                   key: ValueKey<bool>(value2),
//                   onTap: () {
//                     function2();
//                   },
//                   child: Container(
//                     width: width,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: value2
//                             ? Colors.blue
//                             : const Color.fromRGBO(186, 186, 186, 1),
//                       ),
//                       color: value2
//                           ? Colors.blue
//                           : unPressedBColor ??
//                               const Color.fromRGBO(0, 9, 23, 0.06),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           text2,
//                           style: midTextStyle(
//                             context,
//                             value2 ? Colors.white : Colors.black,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//   );
// }
