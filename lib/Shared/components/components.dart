import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

void navTo(BuildContext context , Widget route)
{
  Navigator.of(context).push(MaterialPageRoute(builder: (context)
  {
    return route;
  }));
}

void navAndFinishTo(BuildContext context , Widget widget)
{
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> widget
  ),
        (Route<dynamic> route) => false,

  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  String? label,
  required bool isPrefix,
  bool isSuffix = false,
  bool isPass = false,
  // required
  validate,
  IconData? prefix,
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
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPass,
    enabled: isClickable,
    onFieldSubmitted: (value) {},
    // onChanged: (value) { },

    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label,

      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xffD9D9D9), fontSize: 15),
      hintTextDirection: hintRt1,
      prefixIcon: isPrefix
          ? IconButton(
              icon: Icon(
                prefix,
                color: prefixColor ?? const Color(0xffCCCCCC),
                size: prefixIconSize ?? 25,
              ),
              onPressed: () {
                prefixPressed();
              },
            )
          : null,
      // suffixIcon: isSuffix?  null:suffix,
    ),
    onTap: onTap,
    validator: validate,
    style: const TextStyle(color: Colors.white),
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
          const Size(100, 50), // Set the desired width and height
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
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );


//////////////////////////////////////////////////////////



Widget bulidPostItem({
  required String text,
  required BuildContext context,
  bool isMyPost = false
}) {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff292A2D),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Column(
        children:
        [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                IconButton(
                  icon: Image(image: AssetImage('assets/images/Rectangle.png')),
                  onPressed: ()
                  {

                  },
                ),
                const SizedBox(width: 7,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Row(children:
                      [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text(
                                'د. أحمد',
                                style: textOnBoarding2,
                              ),
                              const Text(
                                ' ٢ أكتوبر ٢٠٢٤',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xffE1E2E9),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                              child: isMyPost ? Icon(Icons.delete_outline,color: const Color(0xffDBBCE1),) :  Image.asset('assets/images/partner_reports.png'),
                            onTap: ()
                            {
                              if(!isMyPost)
                              {
                                showDialog(context: context, builder: (context) => AlertDialog(
                                  backgroundColor: const Color(0xff282a2f),
                                  title: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:
                                      [
                                        Image.asset('assets/images/partner_reports.png',height: 20.0,width: 20.0,),
                                        SizedBox(height: 20.0,),
                                        Text('إبلاغ',style: TextStyle(fontSize: 25.0,color: fontColor),),
                                        SizedBox(height: 20.0,),
                                        Text(
                                            'حدد نوع الإساءة الموجودة في المنشور',
                                            textAlign: TextAlign.center,style: textOnBoarding2)
                                      ],
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                    [
                                      Row(children:
                                      [
                                        Checkbox(activeColor: mainColor,value: true, onChanged: (val){}),
                                        Spacer(),
                                        Text('معلومة غير صحيحة',style: textOnBoarding2,),
                                      ],),
                                      Divider(),
                                      Row(children:
                                      [
                                        Checkbox(activeColor: mainColor,value: false, onChanged: (val){}),
                                        Spacer(),
                                        Text('إساءة باللفظ',style: textOnBoarding2),
                                      ],),
                                      Divider(),
                                      Row(children:
                                      [
                                        Checkbox(activeColor: mainColor,value: true, onChanged: (val){}),
                                        Spacer(),
                                        Text('إزعاج',style: textOnBoarding2),
                                      ],),


                                    ],
                                  ),

                                  actions:
                                  [
                                    TextButton(
                                      child: Text('إرسال',style: TextStyle(color: secondColor),),
                                      onPressed: (){},
                                    ),
                                    TextButton(
                                      child: Text('إلغاء',style: TextStyle(color: fontColor),),
                                      onPressed: (){},
                                    ),

                                  ],

                                  // backgroundColor: backgroundColor,
                                  titlePadding: EdgeInsets.zero,
                                ),);
                              }else
                              {
                                showDialog(context: context, builder: (context) => AlertDialog(
                                  backgroundColor: const Color(0xff282a2f),
                                  title: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:
                                      [
                                        Icon(Icons.delete,color: secondColor,),
                                        SizedBox(height: 20.0,),
                                        Text('هل تريد حذف المنشور ؟',style: TextStyle(fontSize: 25.0,color: fontColor),),
                                        SizedBox(height: 20.0,),
                                      ],
                                    ),
                                  ),
                                  actions:
                                  [
                                    TextButton(
                                      child: Text('حذف',style: TextStyle(color: secondColor),),
                                      onPressed: (){},
                                    ),
                                    TextButton(
                                      child: Text('إلغاء',style: TextStyle(color: fontColor),),
                                      onPressed: (){},
                                    ),

                                  ],


                                  // backgroundColor: backgroundColor,
                                  titlePadding: EdgeInsets.zero,
                                ),);
                              }


                            },
                          ),
                        )
                      ]
                        ,),
                      Row(
                        children:
                        [
                          Expanded(
                            child: ReadMoreText(
                              text,
                              style:  const TextStyle(
                              fontSize: 15,
                              color: Color(0xffE1E2E9),
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
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle like post
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.comment,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle comment on post
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.bookmark_add,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle save post
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


// Not Used !!
Widget buildReviewsItem() {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(
      horizontal: 20,
    ),
    child: Container(
      height: 155,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff292A2D),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Rectangle (5).png'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'د. أحمد',
                  style: textOnBoarding2,
                ),
                const Text(
                  ' ٢ أكتوبر ٢٠٢٤',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xffE1E2E9),
                  ),
                ),
              ],
            ),
            subtitle: const Text(
              'أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ أَبْجَدْ هَوَّزْ',
              style: TextStyle(fontSize: 15, color: Color(0xffE1E2E9)),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle like post
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.comment,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle comment on post
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.bookmark_add,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle save post
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


Widget myNavBar(
{
  required int selectedIndex,
  required List<String> text,
  required Function(int index) onDestinationSelected,
})
{
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white , width: 1.0),
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
          destinations:
              text.asMap().entries.map((entry) => NavigationDestination(
                icon: Container(
                    decoration: BoxDecoration(
                      color: entry.key == selectedIndex ? mainColor : Colors.transparent,),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children:
                        [
                          if(entry.key == selectedIndex)
                            const Icon(Icons.check,color: Colors.black ,size: 18.0,),
                          Expanded(
                            child: Center(
                              child: Text(
                                entry.value,
                                style: TextStyle(color: entry.key == selectedIndex ? Colors.black : fontColor),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )),
                label: '',
              )).toList(),


          onDestinationSelected: onDestinationSelected
        ),
      ),
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
