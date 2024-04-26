// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unnecessary_import

import 'package:autism/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Manage_Admins_Screen extends StatelessWidget {
  Manage_Admins_Screen({super.key});
  List<Widget> screens = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: myNavBar(
                      selectedIndex: 0,
                      text: ['مسؤول', 'مستخدم'],
                      onDestinationSelected: (index) {}),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          hintText: 'البحث',
                          hintStyle: const TextStyle(
                            color: Color(0xffE1E2E9),
                          ),
                          suffixIcon: IconButton(
                            icon: Transform.rotate(
                              angle: 0,
                              child: const Icon(
                                Icons.search,
                                color: fontColor,
                              ),
                            ),
                            onPressed: () {},
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: ((context, index) =>
                          buildAccountsItems(context)),
                      separatorBuilder: ((context, index) => SizedBox(
                            height: 10,
                          )),
                      itemCount: 10),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Column(
//       children: [
//         myNavBar(
//           selectedIndex: 0,
//           text: ['مستخدم', 'مسؤول'],
//           onDestinationSelected: (index) {},
//         ),
//         ListView.separated(
//           itemBuilder: ((context, index) => buildChatItems(context)),
//           separatorBuilder: ((context, index) => SizedBox(
//                 height: 10,
//               )),
//           itemCount: 10,
//         ),
//       ],
//     )
// Column(

//                     children:
//                     [
//                       //navBar
//                       myNavBar(
//                         selectedIndex: cubit.currentProfileScreen,
//                         text: ['منشوراتك','طفلك','المحفوظات'],
//                         onDestinationSelected:(index)
//                         {
//                           cubit.changeCurrentProfileScreen(index);
//                         },
//                       ),

//                       const SizedBox(height: 20.0,),

//                       screens[cubit.currentProfileScreen]
//                     ],
Widget buildChatItems(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff292A2D),
          borderRadius: BorderRadiusDirectional.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/Rectangle (1).png',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'د. أحمد',
                  style: onBoardingDesc,
                ),
                Spacer(),
                const Text(
                  'Oct 8 2024',
                  style: TextStyle(color: Color(0xffE1E2E9), fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'التخصص :  أَبْجَدْ هَوَّزْ حُطِّي كَلَمُنْ سَعْفُصْ ',
                  style: TextStyle(color: fontColor, fontSize: 20),
                ),
                Text(
                  'فتح ملف تعريف الهوية',
                  style: TextStyle(color: Color(0xffA8C8FF), fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defaultElevatedButton(
                  text: 'قبول',
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10.0,
                ),
                defaultElevatedButton(
                  text: 'رفض',
                  color: secondColor,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );

Widget buildAccountsItems(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff292A2D),
          borderRadius: BorderRadiusDirectional.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/Rectangle (6).png',
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  'اﻹسم',
                  style: onBoardingDesc,
                ),
                Spacer(),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Color(0xff43474E),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'د.أحمد',
                    style: TextStyle(color: fontColor, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Spacer(
                  flex: 6,
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 80,
                ),
                Text(
                  'اﻹيميل',
                  style: onBoardingDesc,
                ),
                Spacer(),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Color(0xff43474E),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'username@gmail.com',
                    style: TextStyle(color: Color(0xffE1E2E9), fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Spacer(
                  flex: 6,
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defaultElevatedButton(
                  text: 'حذف',
                  color: secondColor,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
