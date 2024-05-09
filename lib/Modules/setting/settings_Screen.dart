import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xffE1E2E9),
        ),
        title: const Text(
          'الإعدادات',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Color(0xffE1E2E9),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.only(top: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff282A2F),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xffBDC7DC),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'اﻹشعارات',
                              style: TextStyle(
                                  color: Color(0xff273141),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            mySwitch(),
                            const Spacer(),
                            const Text(
                              'اﻹشعارات',
                              style: TextStyle(
                                  color: fontColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if(userType == 'patient')
                const SizedBox(
                height: 10,
              ),
              if(userType == 'patient')
              Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.only(top: 16),
                decoration: BoxDecoration(
                    color: const Color(0xff282A2F),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xffF8D8FE),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'الصلاحيات',
                              style: TextStyle(
                                  color: Color(0xff3E2845),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Switch(
                                  value: false,
                                  onChanged: (val) {},
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
                                const Spacer(),
                                const Text(
                                  'رؤية ملفك الشخصي',
                                  style: TextStyle(
                                      color: fontColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

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
}
