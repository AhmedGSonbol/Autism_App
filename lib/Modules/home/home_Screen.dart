// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:autism/Modules/about/about_screen.dart';
import 'package:autism/Modules/chat/chat_Screen.dart';
import 'package:autism/Modules/info/info_Screen.dart';
import 'package:autism/Modules/profile/profile_Screen.dart';
import 'package:autism/Modules/reviews/reviews_Screen.dart';
import 'package:autism/Modules/setting/settings_Screen.dart';
import 'package:autism/Modules/test/test_Screen.dart';
import 'package:autism/Modules/posts/posts_Screen.dart';
import 'package:autism/Modules/vision/our_vision.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    Posts_Screen(),
    const Chat_Screen(),
    const Reviews_Screen(),
    const Info_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          // toolbarHeight: 64,
          backgroundColor: const Color(0xff292A2D),

          //Avatar image
          leading: Builder(builder: (context) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xffC4C6CF),
                    size: 25,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  color: const Color(0xffC4C6CF),
                  iconSize: 25,
                  onPressed: () {},
                ),
              ],
            );
          }),
          leadingWidth: 100,
          title: const Text(
            'مجتمع التوحد',
            style: TextStyle(
                color: Color(0xffE1E2E9),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,

          actions: [
            InkWell(
              child: Image.asset('assets/images/leading-icon.png'),
              onTap: () {
                //go to profile
                navTo(context, Profile_Screen());
              },
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xff282a2f),
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 40.0),
            children: [
              DrawerHeader(
                child: Container(
                  height: 70,
                  padding: const EdgeInsetsDirectional.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xff43474E),
                      borderRadius: BorderRadius.circular(20)),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Rectangle.png'),
                    ),
                    title: Text(
                      'User Name',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffE1E2E9),
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'username@gmail.com',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xff282a2f),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  padding: const EdgeInsetsDirectional.all(20),
                  decoration: BoxDecoration(
                      color: const Color(0xff43474E),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          navTo(context, Profile_Screen());
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 30,
                              color: Color(0xffA8C8FF),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'الملف الشخصي',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const Settings_Screen();
                            }),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 30,
                              color: Color(0xffA8C8FF),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              ' اﻹعدادات',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const Test_Screen();
                          }));
                        },
                        child: Container(
                          child: const Row(
                            children: [
                              Icon(
                                Icons.quiz,
                                size: 30,
                                color: Color(0xffA8C8FF),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'شخص طفلك ',
                                style: TextStyle(
                                    color: Color(0xffE1E2E9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  padding: const EdgeInsetsDirectional.all(20),
                  decoration: BoxDecoration(
                      color: const Color(0xff43474E),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/captive_portal.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            ' موقعنا',
                            style: TextStyle(
                                color: Color(0xffE1E2E9),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          navTo(context, Our_Vision());
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.flag_circle,
                              size: 30,
                              color: Color(0xffA8C8FF),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              ' رؤيتنا',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          navTo(context, About_Screen());
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/crowdsource.png'),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              ' عنا ',
                              style: TextStyle(
                                  color: Color(0xffE1E2E9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),

                      ///suggestion
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) => AlertDialog(
                      //         backgroundColor: const Color(0xff282a2f),
                      //         title: Padding(
                      //           padding: const EdgeInsets.all(10.0),
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Image.asset(
                      //                 'assets/images/prompt_suggestion.png',
                      //                 height: 20.0,
                      //                 width: 20.0,
                      //               ),
                      //               const SizedBox(
                      //                 height: 20.0,
                      //               ),
                      //               const Text(
                      //                 'اقتراح',
                      //                 style: TextStyle(
                      //                     fontSize: 25.0, color: fontColor),
                      //               ),
                      //               const SizedBox(
                      //                 height: 20.0,
                      //               ),
                      //               const Text(
                      //                   'حدد الجزء المحتاج لتحسين في التطبيق',
                      //                   textAlign: TextAlign.center,
                      //                   style: onBoardingDesc)
                      //             ],
                      //           ),
                      //         ),
                      //         content: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Checkbox(
                      //                     activeColor: mainColor,
                      //                     value: false,
                      //                     onChanged: (val) {}),
                      //                 const Spacer(),
                      //                 Text(
                      //                   'التصميم',
                      //                   style: onBoardingDesc,
                      //                 ),
                      //               ],
                      //             ),
                      //             const Divider(),
                      //             Row(
                      //               children: [
                      //                 Checkbox(
                      //                     activeColor: mainColor,
                      //                     value: false,
                      //                     onChanged: (val) {}),
                      //                 const Spacer(),
                      //                 Text('الأداء', style: onBoardingDesc),
                      //               ],
                      //             ),
                      //             const Divider(),
                      //             Row(
                      //               children: [
                      //                 Checkbox(
                      //                     activeColor: mainColor,
                      //                     value: true,
                      //                     onChanged: (val) {}),
                      //                 const Spacer(),
                      //                 Text('الذكاء الإصطناعي',
                      //                     style: onBoardingDesc),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //
                      //         actions: [
                      //           TextButton(
                      //             child: const Text(
                      //               'إرسال',
                      //               style: TextStyle(color: secondColor),
                      //             ),
                      //             onPressed: () {},
                      //           ),
                      //           TextButton(
                      //             child: const Text(
                      //               'إلغاء',
                      //               style: TextStyle(color: fontColor),
                      //             ),
                      //             onPressed: () {
                      //               Navigator.pop(context);
                      //             },
                      //           ),
                      //         ],
                      //
                      //         // backgroundColor: backgroundColor,
                      //         titlePadding: EdgeInsets.zero,
                      //       ),
                      //     );
                      //   },
                      //   child: Row(
                      //     children: [
                      //       Image.asset('assets/images/prompt_suggestion.png'),
                      //       const SizedBox(
                      //         width: 15,
                      //       ),
                      //       const Text(
                      //         'إقتراح',
                      //         style: TextStyle(
                      //             color: Color(0xffE1E2E9),
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 15),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(50, 50), // Set the desired width and height
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffDBBCE1)),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تسجل الخروج',
                        style: TextStyle(
                            color: Color(0xff3E2845),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Icon(
                        Icons.logout,
                        color: Color(0xff3E2845),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? const TextStyle(color: fontColor)
                    : const TextStyle(color: Colors.black),
          )),
          child: NavigationBar(
            backgroundColor: const Color(0xff1D2024),
            indicatorColor: Color(0xFF3D4758),
            elevation: 0.0,

            // shadowColor: Colors.yellowAccent,
            // surfaceTintColor: Colors.red,

            selectedIndex: _currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: [
              NavigationDestination(
                  icon: Icon(
                      _currentIndex == 0 ? Icons.forum : Icons.forum_outlined,
                      color: Color(0xffE1E2E9)),
                  label: 'الرئيسية'),
              NavigationDestination(
                  icon: Icon(
                      _currentIndex == 1 ? Icons.chat : Icons.chat_outlined,
                      color: Color(0xffE1E2E9)),
                  label: 'تحدث'),
              NavigationDestination(
                  icon: Icon(
                      _currentIndex == 2
                          ? Icons.reviews
                          : Icons.reviews_outlined,
                      color: Color(0xffE1E2E9)),
                  label: 'إرشاد'),
              NavigationDestination(
                  icon: Icon(
                      _currentIndex == 3
                          ? Icons.local_library
                          : Icons.local_library_outlined,
                      color: Color(0xffE1E2E9)),
                  label: 'عن التوحد')
            ],
          ),
        ),
      ),
    );
  }
}
