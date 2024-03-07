import 'package:autism/Shared/Constants/Constants.dart';
import 'package:flutter/material.dart';

void navTo(BuildContext context , Widget route)
{
  Navigator.of(context).push(MaterialPageRoute(builder: (context)
  {
    return route;
  }));
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
      border: OutlineInputBorder(),
      labelText: label,

      hintText: hint,
      hintStyle: TextStyle(color: Color(0xffD9D9D9), fontSize: 15),
      hintTextDirection: hintRt1,
      prefixIcon: isPrefix
          ? IconButton(
              icon: Icon(
                prefix,
                color: prefixColor ?? Color(0xffCCCCCC),
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
    style: TextStyle(color: Colors.white),
  );
}

//  hintTextDirection: TextDirection.rtl,
//  hintText: 'الإيميل',

// hintStyle:
// TextStyle(color: Color(0xffD9D9D9), fontFamily: 'Roboto'),

Widget defaultButton({
  double width = 100,
  Color color = const Color(0xffA8C8FF),
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
        style: TextStyle(
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
  required void Function()? onPressed,
  required String text,
  Color? color,
  Color? textColor,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(elevation),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(100, 50), // Set the desired width and height
        ),
        backgroundColor: MaterialStatePropertyAll(
          color ?? Color(0xffA8C8FF),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textColor ?? Color(0xff05305F),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );


//////////////////////////////////////////////////////////

Widget buildChatItems() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    height: 170,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xff292A2D),
      borderRadius: BorderRadiusDirectional.circular(30),
    ),
    child: Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/Rectangle (1).png',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'د. أحمد',
                style: textOnBoarding2,
              ),
              SizedBox(
                width: 190,
              ),
              Text(
                '  ٥:٢٢ م',
                style: TextStyle(color: Color(0xffE1E2E9), fontSize: 20),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                ' أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ ',
                style: TextStyle(color: Color(0xffE1E2E9), fontSize: 20),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffA8C8FF)),
                  child: Center(
                    child: Text(
                      '٢',
                      style: TextStyle(
                          color: Color(0xff05305F),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  ),
);

Widget bulidPostItem() {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
    child: Container(
      height: 155,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff292A2D),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Rectangle.png'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'د. أحمد',
                  style: textOnBoarding2,
                ),
                Text(
                  ' ٢ أكتوبر ٢٠٢٤',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xffE1E2E9),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              'أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ أَبْجَدْ هَوَّزْ',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffE1E2E9),
                  overflow: TextOverflow.ellipsis),
            ),
            trailing: Image.asset('assets/images/partner_reports.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle like post
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle comment on post
                },
              ),
              IconButton(
                icon: Icon(
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

Widget buildReviewsItem() {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(
      horizontal: 20,
    ),
    child: Container(
      height: 155,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff292A2D),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Rectangle (5).png'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'د. أحمد',
                  style: textOnBoarding2,
                ),
                Text(
                  ' ٢ أكتوبر ٢٠٢٤',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xffE1E2E9),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              'أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ أَبْجَدْ هَوَّزْ',
              style: TextStyle(fontSize: 15, color: Color(0xffE1E2E9)),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle like post
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Color(0xffE1E2E9),
                ),
                onPressed: () {
                  // Handle comment on post
                },
              ),
              IconButton(
                icon: Icon(
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
