import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/modules/user_home/chat.dart';
import 'package:autism/modules/user_home/drawer_slide/testing/test_splash.dart';
import 'package:autism/modules/user_home/info.dart';
import 'package:autism/modules/user_home/main.dart';
import 'package:autism/modules/user_home/reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'drawer_slide/setting/user_setting.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _currentIndex = 0;

  List<Widget> screens =
  [
    Home2(),
    const ChatHome(),
    const ReviewsScreen(),
    const InfoAutism(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          // toolbarHeight: 64,
          backgroundColor: const Color(0xff292A2D),
          leading: Image.asset('assets/images/leading-icon.png'),
          title: const Text(
            'مجتمع التوحد',
            style: TextStyle(
                color: Color(0xffE1E2E9),
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Container(
              width: 48,
              height: 48,
              child: const Icon(
                Icons.search,
                color: Color(0xffC4C6CF),
                size: 40,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 48,
              height: 48,
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xffC4C6CF),
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xff282a2f),
          child: ListView(
            // padding: EdgeInsets.zero,
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
                      'أحمد رمضان',
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
                      const Row(
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
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const UserSetting();
                            }),
                          );
                        },
                        child: Container(
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
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const TestSplash();
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
                      const Row(
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
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
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
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/prompt_suggestion.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'شخص طفلك ',
                            style: TextStyle(
                                color: Color(0xffE1E2E9),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(50, 50), // Set the desired width and height
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xffDBBCE1)),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor:
              const Color(0xffD9E3F8), // Set the color of the selected item
          unselectedItemColor:
              Colors.grey, // Set the color of the unselected items
          backgroundColor: const Color(0xff1d2024),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.forum),
              label: 'الرئيسية',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'تحدث',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.reviews),
              label: 'إرشاد',
            ),
            const BottomNavigationBarItem(
              // backgroundColor: Colors.white,
              icon: Icon(Icons.local_library),
              label: 'عن التوحد',
            ),
          ],
        ),
      ),
    );
  }
}
