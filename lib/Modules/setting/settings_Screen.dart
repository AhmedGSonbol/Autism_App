import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({super.key});

  @override
  Widget build(BuildContext context)
  {
    var la = S.of(context);

    Map<String , String> langs =
    {
      'en':'English',
      'ar':'العربية',
      // 'fr':'Français',
      // 'es':'Español',
    };

    return BlocConsumer<AppCubit,AppStates>
      (
        listener: (context, state) {},
        builder: (context, state)
        {
          AppColors colors = AppColors(context);

          var cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: colors.fontColor(),
              ),
              title:  Text(
                la.settings,
                style: TextStyle(
                  fontSize: 25,

                  color: colors.fontColor(),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children:
                  [
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsetsDirectional.only(top: 16),
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xff282A2F),
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                    //   child: Center(
                    //     child: Column(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Container(
                    //             height: 40,
                    //             decoration: BoxDecoration(
                    //                 color: const Color(0xffBDC7DC),
                    //                 borderRadius: BorderRadius.circular(30)),
                    //             child: const Center(
                    //               child: Text(
                    //                 'اﻹشعارات',
                    //                 style: TextStyle(
                    //                     color: Color(0xff273141),
                    //                     fontSize: 20,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               mySwitch(),
                    //               const Spacer(),
                    //               const Text(
                    //                 'اﻹشعارات',
                    //                 style: TextStyle(
                    //                     color: fontColor,
                    //                     fontSize: 18,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // if(userType == 'patient' || userType == 'doctor')
                    const SizedBox(
                        height: 10,
                      ),
                    // if(userType == 'patient' || userType == 'doctor')
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            color:  colors.home_drawer_item_background(),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Switch(
                                //       value: AppCubit.get(context).userModel!.data!.profile_status!,
                                //       onChanged: (val)
                                //       {
                                //         AppCubit.get(context).changeProfileStatus(val);
                                //
                                //       },
                                //       activeTrackColor: const Color(0xffA8C8FF),
                                //       thumbIcon: MaterialStateProperty.resolveWith(
                                //             (Set<MaterialState> states) {
                                //           if (states
                                //               .contains(MaterialState.selected)) {
                                //             return const Icon(Icons.check,
                                //                 color: Color(0xffA8C8FF));
                                //           }
                                //           return null;
                                //         },
                                //       ),
                                //       thumbColor: MaterialStateProperty.resolveWith(
                                //             (Set<MaterialState> states) {
                                //           if (states
                                //               .contains(MaterialState.selected)) {
                                //             return const Color(0xff05305F);
                                //           }
                                //           return Colors.grey;
                                //         },
                                //       ),
                                //     ),
                                //     const Spacer(),
                                //      Text(
                                //       'رؤية ملفك الشخصي',
                                //       style: TextStyle(
                                //           color: colors.fontColor(),
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     mySwitch(),
                                //     const Spacer(),
                                //     const Text(
                                //       'رؤيتك في البحث',
                                //       style: TextStyle(
                                //           color: fontColor,
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     mySwitch(),
                                //     const Spacer(),
                                //     const Text(
                                //       'التحدث معك',
                                //       style: TextStyle(
                                //           color: fontColor,
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     mySwitch(),
                                //     const Spacer(),
                                //     const Text(
                                //       'التعليق علي منشورك',
                                //       style: TextStyle(
                                //           color: fontColor,
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     mySwitch(),
                                //     const Spacer(),
                                //     const Text(
                                //       'التطبيق استخدام بيانات التشخيص',
                                //       style: TextStyle(
                                //           color: fontColor,
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    Text(
                                      AppCubit.get(context).isDarkMode ? la.darkMode :la.lightMode,
                                      style: TextStyle(
                                          color: colors.fontColor(),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    const Spacer(),
                                    Switch(
                                      value: AppCubit.get(context).isDarkMode,
                                      onChanged: (val)
                                      {
                                        AppCubit.get(context).changeMode();

                                      },
                                      activeTrackColor: const Color(0xffA8C8FF),
                                      thumbIcon: MaterialStateProperty.resolveWith(
                                            (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.selected)) {
                                            return const Icon(Icons.check,
                                                color: Color(0xffA8C8FF));
                                          }
                                          return null;
                                        },
                                      ),
                                      thumbColor: MaterialStateProperty.resolveWith(
                                            (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.selected)) {
                                            return const Color(0xff05305F);
                                          }
                                          return Colors.grey;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children:
                                  [
                                    Text(
                                      la.language,
                                      style: TextStyle(
                                          color: colors.fontColor(),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    const Spacer(),
                                    DropdownButton(

                                      value:  current_lang ,
                                      onChanged: (val)
                                      {

                                        if(val == 'en' && current_lang != 'en')
                                        {
                                          cubit.changeLang(val!);
                                        }
                                        else if(val == 'ar' && current_lang != 'ar')
                                        {
                                          cubit.changeLang(val!);
                                        }
                                        // else if(val == 'fr' && current_lang != 'fr')
                                        // {
                                        //   cubit.changeLang(val!);
                                        // }
                                        // else if(val == 'es' && current_lang != 'es')
                                        // {
                                        //   cubit.changeLang(val!);
                                        // }
                                      },
                                      items:
                                      [
                                        DropdownMenuItem(child: Text(langs['en']!),value: 'en',),
                                        DropdownMenuItem(child: Text(langs['ar']!) , value: 'ar',),
                                        // DropdownMenuItem(child: Text(langs['fr']!) , value: 'fr',),
                                        // DropdownMenuItem(child: Text(langs['es']!) , value: 'es',),
                                      ],
                                      style: TextStyle(fontSize: 17.0,color: colors.fontColor()),
                                      dropdownColor: colors.home_drawer_background_color(),
                                      iconEnabledColor: mainColor,
                                      borderRadius: BorderRadius.circular(15.0),


                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                    // Switch(
                    //   // activeColor: defaultColor,
                    //     activeTrackColor: mainColor,
                    //     inactiveTrackColor: Colors.grey.withOpacity(0.5),
                    //     inactiveThumbColor: Colors.black,
                    //     // activeColor: Colors.yellowAccent,
                    //
                    //     value: AppCubit.get(context).isDarkMode,
                    //     onChanged: (val)
                    //     {
                    //       AppCubit.get(context).changeMode();
                    //     }
                    // ),



                    // Backup
                    // Padding(
                    //   padding: const EdgeInsetsDirectional.only(top: 10),
                    //   child: Container(
                    //     height: 200,
                    //     width: double.infinity,
                    //     padding: const EdgeInsetsDirectional.only(top: 16),
                    //     decoration: BoxDecoration(
                    //         color: const Color(0xff282A2F),
                    //         borderRadius: BorderRadius.circular(30)),
                    //     child: Center(
                    //       child: Column(
                    //         children: [
                    //           Container(
                    //             width: 170,
                    //             height: 40,
                    //             decoration: BoxDecoration(
                    //                 color: const Color(0xffBDC7DC),
                    //                 borderRadius: BorderRadius.circular(30)),
                    //             child: const Center(
                    //               child: Text(
                    //                 'النسخة اﻹحتياطية',
                    //                 style: TextStyle(
                    //                     color: Color(0xff273141),
                    //                     fontSize: 20,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             height: 20,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsetsDirectional.only(end: 20),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.end,
                    //               children: [
                    //                 ElevatedButton(
                    //                   onPressed: () {},
                    //                   style: const ButtonStyle(
                    //                     backgroundColor: MaterialStatePropertyAll(
                    //                       Color(0xffA8C8FF),
                    //                     ),
                    //                   ),
                    //                   child: const Row(
                    //                     children: [
                    //                       Icon(
                    //                         Icons.download,
                    //                         color: Color(0xff05305F),
                    //                       ),
                    //                       Text(
                    //                         'نسخ',
                    //                         style: TextStyle(
                    //                             color: Color(0xff05305F),
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: 18),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 20,
                    //                 ),
                    //                 const Text(
                    //                   'عمل نسخة للمحادثات و اﻹعدادات',
                    //                   style: TextStyle(
                    //                       color: fontColor,
                    //                       fontSize: 17,
                    //                       fontWeight: FontWeight.bold),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             height: 20,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsetsDirectional.only(end: 20),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.end,
                    //               children: [
                    //                 ElevatedButton(
                    //                   onPressed: () {},
                    //                   style: const ButtonStyle(
                    //                     backgroundColor: MaterialStatePropertyAll(
                    //                       Color(0xffA8C8FF),
                    //                     ),
                    //                   ),
                    //                   child: const Row(
                    //                     children: [
                    //                       Icon(
                    //                         Icons.upload,
                    //                         color: Color(0xff05305F),
                    //                       ),
                    //                       Text(
                    //                         'إسترداد',
                    //                         style: TextStyle(
                    //                             color: Color(0xff05305F),
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: 18),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 40,
                    //                 ),
                    //                 const Text(
                    //                   'إسترداد النسخة اﻹحتياطية',
                    //                   style: TextStyle(
                    //                       color: fontColor,
                    //                       fontSize: 17,
                    //                       fontWeight: FontWeight.bold),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );

        },
    );
  }

  // Widget mySwitch() {
  //   return Switch(
  //     value: true,
  //     onChanged: (val) {},
  //     activeTrackColor: const Color(0xffA8C8FF),
  //     thumbIcon: MaterialStateProperty.resolveWith(
  //       (Set<MaterialState> states) {
  //         if (states.contains(MaterialState.selected)) {
  //           return const Icon(Icons.check, color: Color(0xffA8C8FF));
  //         }
  //         return null;
  //       },
  //     ),
  //     thumbColor: MaterialStateProperty.resolveWith(
  //       (Set<MaterialState> states) {
  //         if (states.contains(MaterialState.selected)) {
  //           return const Color(0xff05305F);
  //         }
  //         return Colors.grey;
  //       },
  //     ),
  //   );
  // }
}
