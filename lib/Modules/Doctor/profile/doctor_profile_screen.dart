// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autism/Modules/Doctor/doctor/doctor_screen.dart';
import 'package:autism/Modules/Doctor/doctor_profile_posts/doctor_profile_posts_screen.dart';
import 'package:autism/Modules/Doctor/profile_Saves/profile_Saves_Screen.dart';
import 'package:autism/Modules/Doctor/profile_edit/doctor_profile_edit.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Doctor_Profile_Screen extends StatelessWidget {
  Doctor_Profile_Screen({super.key});
  List<Widget> screens = [
    const Doctor_Profile_Posts_Screen(),
    Doctor_Details(),
    const Doctor_Profile_Saves_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: const Color(0xff43474E),
            title: const Text(
              'الملف الشخصي',
              style: TextStyle(color: fontColor),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: const Color(0xffE1E2E9),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //User info
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff43474E),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            iconSize: 25.0,
                            padding: EdgeInsets.zero,
                            icon: const SizedBox(),
                            onPressed: () {},
                          ),
                          const Hero(
                              tag: 'doctor_profile_image',
                              child: Image(
                                image: AssetImage(
                                    'assets/images/Rectangle (5).png'),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )),
                          IconButton(
                            iconSize: 25.0,
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.edit,
                              color: fontColor,
                            ),
                            onPressed: () {
                              navTo(context, Doctor_Profile_Edit_Screen());
                            },
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 10.0,
                      ),

                      //username
                      const Text(
                        'د.محمد عمار',
                        style: TextStyle(fontSize: 25.0, color: fontColor),
                      ),

                      const SizedBox(
                        height: 5.0,
                      ),

                      //location
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'العياده : مصر - البحيرة - دمنهور',
                            style: onBoardingDesc,
                          ),
                          Icon(
                            Icons.location_on,
                            color: fontColor,
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      myNavBar(
                          selectedIndex: cubit.currentProfileScreen,
                          text: ['منشوراتك', 'أنت', 'المحفوظات'],
                          onDestinationSelected: (index) {
                            cubit.changeCurrentProfileScreen(index);
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      screens[cubit.currentProfileScreen]
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


// class Profile_Screen extends StatelessWidget {
//   Profile_Screen({Key? key}) : super(key: key);


//   List<Widget> screens =
//   [
//     const Profile_Posts_Screen(),
//     Profile_Child_Screen(),
//     const Profile_Saves_Screen()
//   ];

//   @override
//   Widget build(BuildContext context)
//   {
//     return BlocConsumer<AppCubit,AppStates>(
//       listener: (context, state) {},
//       builder: (context, state)
//       {

//         var cubit = AppCubit.get(context);

//         return Scaffold(
//           backgroundColor: backgroundColor,
//           appBar: AppBar(
//             backgroundColor: const Color(0xff43474E),
//             title: const Text('الملف الشخصي',style: TextStyle(color: fontColor),),
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.arrow_back),
//               color: const Color(0xffE1E2E9),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children:
//               [
//                 //User info
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: Color(0xff43474E),
//                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0),bottomLeft: Radius.circular(16.0))
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children:
//                     [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children:
//                         [
//                           IconButton(
//                             iconSize: 25.0,
//                             padding: EdgeInsets.zero,
//                             icon: const SizedBox(),
//                             onPressed: ()
//                             {

//                             },),
//                           const Hero(
//                             tag: 'profile_image',
//                               child: Image(image: AssetImage('assets/images/Rectangle.png'),width: 100,height: 100,fit: BoxFit.cover,)),
//                           IconButton(
//                             iconSize: 25.0,
//                             padding: EdgeInsets.zero,
//                             icon: const Icon(Icons.edit,color: fontColor,),
//                           onPressed: ()
//                           {
//                             navTo(context, Profile_Edit_Screen());
//                           },)
//                         ],
//                       ),

//                       const SizedBox(height: 10.0,),

//                       //username
//                       const Text('أحمد سنبل',style: TextStyle(fontSize: 25.0,color: fontColor),),

//                       const SizedBox(height: 5.0,),

//                       //location
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children:
//                         [
//                           Text('مصر - البحيرة',style: onBoardingDesc,),
//                           Icon(Icons.location_on,color: fontColor,)
//                         ],
//                       ),

//                       const SizedBox(height: 20.0,),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20.0,),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Column(

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
//                   ),
//                 )


//               ],
//             ),
//           ),
//         );

//       },
//     );
//   }
// }