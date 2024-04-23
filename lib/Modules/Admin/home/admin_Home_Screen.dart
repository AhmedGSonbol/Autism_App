// ignore_for_file: unused_import, sort_child_properties_last, prefer_const_constructors

import 'package:autism/Models/about/about_screen.dart';
import 'package:autism/Modules/Admin/admin_profile/admin_profile_screen.dart';
import 'package:autism/Modules/Admin/complaints/complaints_Screen.dart';
import 'package:autism/Modules/Admin/manage_Admins/manage_Accounts_Screen.dart';
import 'package:autism/Modules/Admin/requests/requests_Screen.dart';
import 'package:autism/Modules/Admin/settings/admin_settings_screen.dart';
import 'package:autism/Modules/Admin/suggestions/suggestions_screen.dart';
import 'package:autism/Modules/chat/chat_Screen.dart';
import 'package:autism/Modules/info/info_Screen.dart';
import 'package:autism/Modules/profile/profile_Screen.dart';
import 'package:autism/Modules/reviews/reviews_Screen.dart';
import 'package:autism/Modules/setting/settings_Screen.dart';
import 'package:autism/Modules/test/test_Screen.dart';
import 'package:autism/Modules/posts/posts_Screen.dart';
import 'package:autism/Modules/vision/our_vision.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Admin_Home_Screen extends StatefulWidget {
  @override
  _Admin_Home_ScreenState createState() => _Admin_Home_ScreenState();
}

class _Admin_Home_ScreenState extends State<Admin_Home_Screen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const Requests_Screen(),
    const Complaints_Screen(),
    const Manage_Admins_Screen(),
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
                  navTo(context, Admin_Profile_Screen());
                },
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: const Color(0xff282a2f),
            child: ListView(
              physics: const BouncingScrollPhysics(),
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
                        'Admin Name',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffE1E2E9),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'adminame@gmail.com',
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
                            navTo(context, Admin_Profile_Screen());
                          },
                          child: const Row(
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
                                return const Admin_Settings_Screen();
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
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            navTo(context, Suggestions_Screen());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                  'assets/images/prompt_suggestion.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'اﻹقتراحات',
                                style: TextStyle(
                                    color: Color(0xffE1E2E9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
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
              indicatorColor: const Color(0xFF3D4758),
              elevation: 0.0,

              // shadowColor: Colors.yellowAccent,
              // surfaceTintColor: Colors.red,

              selectedIndex: _currentIndex,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              destinations: [
                NavigationDestination(
                    icon: Icon(
                        _currentIndex == 0 ? Icons.forum : Icons.forum_outlined,
                        color: const Color(0xffE1E2E9)),
                    label: 'الإنضمام'),
                NavigationDestination(
                    icon: Icon(
                        _currentIndex == 1 ? Icons.chat : Icons.chat_outlined,
                        color: const Color(0xffE1E2E9)),
                    label: 'الشكاوي'),
                NavigationDestination(
                    icon: Icon(
                        _currentIndex == 2
                            ? Icons.reviews
                            : Icons.reviews_outlined,
                        color: const Color(0xffE1E2E9)),
                    label: 'الحسابات'),
              ],
            ),
          )),
    );
  }
}
