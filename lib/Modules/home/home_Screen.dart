// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:autism/Modules/Admin/complaints/complaints_Screen.dart';
import 'package:autism/Modules/Admin/manage_Admins/manage_Accounts_Screen.dart';
import 'package:autism/Modules/Admin/requests/requests_Screen.dart';
import 'package:autism/Modules/about/about_screen.dart';
import 'package:autism/Modules/chat/chat_Screen.dart';
import 'package:autism/Modules/info/info_Screen.dart';
import 'package:autism/Modules/login/login_Screen.dart';
import 'package:autism/Modules/profile/profile_Screen.dart';
import 'package:autism/Modules/profile_Edit/profile_Edit_Screen.dart';
import 'package:autism/Modules/reviews/reviews_Screen.dart';
import 'package:autism/Modules/search/search_Screen.dart';
import 'package:autism/Modules/setting/settings_Screen.dart';
import 'package:autism/Modules/test/test_Screen.dart';
import 'package:autism/Modules/posts/posts_Screen.dart';
import 'package:autism/Modules/vision/our_vision.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/network/local/Cach_Helper.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:autism/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';


class Home_Screen extends StatelessWidget {


  List<Widget> screens = [
    Posts_Screen(),
    const Chat_Screen(),
    const Reviews_Screen(),
    const Info_Screen(),
  ];

  List<Widget> adminScreens =
  [
    const Requests_Screen(),
    const Complaints_Screen(),
    Manage_Admins_Screen(),
  ];

  @override
  Widget build(BuildContext context)
  {
    var la = S.of(context);

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
        if(state is SuccessGetUserDataState)
        {
          if(state.isView == false)
          {
            if(userType == 'admin')
            {
              // getPending();

            }else
            {
              AppCubit.get(context).getPatientsPosts();
              AppCubit.get(context).getDoctorsPosts();
            }
          }

        }
        if(state is SuccessDeletePostState)
        {
          myToast(msg: la.successDeletePost, state: ToastStates.SUCCESS);
        }
        if(state is SuccessAddReportState)
        {
          myToast(msg: la.successAddReport, state: ToastStates.SUCCESS);
        }
        if(state is ErrorAddReportState)
        {
          myToast(msg: la.errorAddReport, state: ToastStates.ERROR);
        }
        if(state is SuccessAddPostState)
        {
          myToast(msg: la.successAddPost, state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state)
      {

        var la = S.of(context);

        var cubit = AppCubit.get(context);

        AppColors colors = AppColors(context);


        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(

                // toolbarHeight: 64,

                //Avatar image
                leading: Builder(builder: (context) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer(); // Open the drawer
                        },
                        icon:  Icon(
                          Icons.menu,
                          color: colors.fontColor(),
                          size: 25,
                        ),
                      ),
                      if(userType != 'admin')
                      IconButton(
                        icon: const Icon(Icons.search),
                        color: colors.fontColor(),
                        iconSize: 25,
                        onPressed: ()
                        {
                          navTo(context, Search_Screen());

                        },
                      ),
                    ],
                  );
                }),
                leadingWidth: 100,
                title:  Text(
                  la.autiSociety,
                  style: TextStyle(
                      color: colors.fontColor(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,

                actions: [
                  Row(
                    children: [

                      InkWell(
                        child: myImageProvider(cubit.userModel?.data?.image),
                        // child: CircleAvatar(
                        //   backgroundImage: (()
                        //   {
                        //     if (cubit.userModel != null)
                        //     {
                        //       if (cubit.userModel!.data!.image != null && cubit.userModel!.data!.image!.isNotEmpty)
                        //       {
                        //         return NetworkImage(cubit.userModel!.data!.image!) as ImageProvider;
                        //       } else
                        //       {
                        //         return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                        //       }
                        //     }
                        //     else
                        //     {
                        //       return AssetImage('assets/images/Rectangle.png') as ImageProvider;
                        //     }
                        //   }()),
                        // ) ,
                        onTap: () {
                          //go to profile
                          if(cubit.userModel != null)
                          {
                            if(userType != 'admin')
                            {
                              navTo(context, Profile_Screen(isView: false,));
                            }
                            else
                            {
                              navTo(context, Profile_Edit_Screen());
                            }
                          }
                          else
                          {
                            myToast(msg: la.loadingUserData, state: ToastStates.WARNING);
                          }
                        },
                      ),
                      SizedBox(width: 10.0,),
                    ],
                  ),
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 40.0),
                  children: [
                    DrawerHeader(
                      child: Container(
                        height: 70,
                        padding: const EdgeInsetsDirectional.all(10),
                        decoration: BoxDecoration(
                            color: colors.home_drawer_item_background(),
                            borderRadius: BorderRadius.circular(20)),
                        child:  ListTile(
                          leading:  myImageProvider(cubit.userModel?.data?.image),
                          title: Text(
                            cubit.userModel != null
                                ?
                            cubit.userModel!.data!.name!
                                :
                            la.userName,
                            style: TextStyle(
                                fontSize: 20,
                                color: colors.fontColor(),
                                fontWeight: FontWeight.bold
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          subtitle:

                          Text(
                            cubit.userModel != null
                                ?
                            cubit.userModel!.data!.email!
                                :
                            la.email,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: colors.home_drawer_email_color(),
                            ),
                            maxLines: 1,

                          ),
                        ),
                      ),
                      decoration:  BoxDecoration(
                        color: colors.home_drawer_background_color(),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Container(
                        padding: const EdgeInsetsDirectional.all(20),
                        decoration: BoxDecoration(
                            color: colors.home_drawer_item_background(),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: ()
                              {
                                if(cubit.userModel != null)
                                {
                                  if(userType != 'admin')
                                  {
                                    navTo(context, Profile_Screen(isView: false,));
                                  }
                                  else
                                  {
                                    navTo(context, Profile_Edit_Screen());
                                  }
                                }
                                else
                                {
                                  myToast(msg: la.loadingUserData, state: ToastStates.WARNING);
                                }



                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    size: 30,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    la.profile,
                                    style: TextStyle(
                                        color: colors.fontColor(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            // if(userType != 'admin')
                            const SizedBox(
                              height: 30,
                            ),
                            // if(userType != 'admin')
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const Settings_Screen();
                                  }),
                                );
                              },
                              child:  Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    size: 30,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    la.settings,
                                    style: TextStyle(
                                        color: colors.fontColor(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            if(userType == 'patient')
                              const SizedBox(height: 30,),
                            if(userType == 'patient')
                              GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const Test_Screen();
                                }));
                              },
                              child: Container(
                                child:  Row(
                                  children: [
                                    Icon(
                                      Icons.quiz,
                                      size: 30,
                                      color: mainColor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      la.testChild,
                                      style: TextStyle(
                                          color: colors.fontColor(),
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
                            color: colors.home_drawer_item_background(),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: ()async
                              {
                                final Uri url = Uri.parse('https://auti-socity.vercel.app/');
                                if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                              }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.web,
                                    size: 30,
                                    color: mainColor,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Text(
                                    la.website,
                                    style: TextStyle(
                                        color: colors.fontColor(),
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
                                navTo(context, Our_Vision());
                              },
                              child:  Row(
                                children: [
                                  Icon(
                                    Icons.flag_circle,
                                    size: 30,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    la.ourVision,
                                    style: TextStyle(
                                        color: colors.fontColor(),
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
                                children:
                                [
                                  Icon(
                                    Icons.groups,
                                    size: 30,
                                    color: mainColor,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                   Text(
                                    la.aboutUs,
                                    style: TextStyle(
                                        color: colors.fontColor(),
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
                            //             color: colors.fontColor(),
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
                        onPressed: ()
                        {
                          CachHelper.removeData(key: 'token').then((value)
                          {
                            CachHelper.removeData(key: 'user_type').then((value)
                            {
                              token = '';
                              userType = '';
                              cubit.currentAccountsScreen = 0;
                              cubit.currentNavBarIndex = 0;
                              cubit.currentProfileScreen = 0;
                              cubit.currentTestScreen = 0;

                              cubit.userModel = null;
                              cubit.viewUserModel = null;

                              cubit.myPosts  = [];
                              cubit.mySavedPosts  = [];
                              cubit.usersPostsModel = null;
                              cubit.doctorsPostsModel = null;
                              navAndFinishTo(context, Login_Screen());
                            });
                          });

                        },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              la.logout,
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
              body: userType == 'admin' ? adminScreens[cubit.currentNavBarIndex] : screens[cubit.currentNavBarIndex],

              bottomNavigationBar: NavigationBar(

                // backgroundColor: const Color(0xff1D2024),
                // indicatorColor: Color(0xFF3D4758),
                elevation: 0.0,

                // shadowColor: Colors.yellowAccent,
                // surfaceTintColor: Colors.red,

                selectedIndex: cubit.currentNavBarIndex,
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                onDestinationSelected: (index)
                {
                  cubit.changeCurrentNavBarScreen(index);

                },
                destinations: userType != 'admin' ? getUserDestinations(cubit.currentNavBarIndex,colors,la) :  getAdminDestinations(cubit.currentNavBarIndex,colors,la),
              ),
              // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
              floatingActionButton: (()
              {
                if(userType == 'admin' && cubit.currentNavBarIndex == 2 && cubit.currentAccountsScreen == 0)
                {
                  return FloatingActionButton(
                    onPressed: ()
                    {
                      navTo(context, Profile_Edit_Screen(isAddAdmin:  true,));
                    },
                    child: Icon(
                      Icons.person_add_alt_1_outlined,
                      color: Colors.white,
                    ),
                    // backgroundColor: Color(0xff254777),

                  );
                }

              }()),
            ),
            if(
            state is LoadingRejectDoctorsState
            ||  state is LoadingConfirmDoctorsState
            || state is LoadingDeleteUserState
            || state is LoadingConfirmReportedPostState
            || state is LoadingRejectReportedPostState
            || state is LoadingDeletePostState
            || state is LoadingAddReportState
            || state is LoadingAddPostState
            )
              Positioned.fill(
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(color: mainColor,),
                  ),
                ),
              ),
          ],
        );

      },
    );
  }




  List<Widget> getUserDestinations (int index , AppColors colors,S la)
  {
    return  [
      NavigationDestination(
          icon: Icon(
              index == 0 ? Icons.forum : Icons.forum_outlined,
              color: colors.fontColor()),
          label: la.main),
      NavigationDestination(
          icon: Icon(
              index == 1 ? Icons.chat : Icons.chat_outlined,
              color: colors.fontColor()),
          label: la.chat),
      NavigationDestination(
          icon: Icon(
              index == 2
                  ? Icons.reviews
                  : Icons.reviews_outlined,
              color: colors.fontColor()),
          label: la.review),
      if(userType == 'patient')
        NavigationDestination(
            icon: Icon(
                index == 3
                    ? Icons.local_library
                    : Icons.local_library_outlined,
                color: colors.fontColor()),
            label: la.aboutAutism)
    ];
  }

  List<Widget> getAdminDestinations (int index , AppColors colors,S la)
  {
    return  [
      NavigationDestination(
          icon: Icon(
              index == 0 ? Icons.forum : Icons.forum_outlined,
              color: colors.fontColor()),
          label: la.requests),
      NavigationDestination(
          icon: Icon(
              index == 1 ? Icons.chat : Icons.chat_outlined,
              color: colors.fontColor()),
          label: la.complaint),
      NavigationDestination(
          icon: Icon(
              index == 2
                  ? Icons.reviews
                  : Icons.reviews_outlined,
              color: colors.fontColor()),
          label: la.accounts),
    ];
  }

}
