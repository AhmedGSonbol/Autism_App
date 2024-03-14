import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DoctorAccount3 extends StatelessWidget
{
  const DoctorAccount3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 83,
                  ),
                  const Text(
                    'إكتمل إنشاء حسابك',
                    style: TextStyle(
                        color: Color(0xffC7C6CA),
                        fontFamily: 'Roboto',
                        height: 2,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/account_circle.png',
                        width: 120,
                        height: 120,
                      ),
                      // Image.asset(
                      //   'assets/Icon button toggleable-dark.png',
                      //   height: 48,
                      //   width: 48,
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'تهانينا, لقد إكتمل إنشاء حسابك و اﻷن يمكنك المساهم في نشر الوعي و مساعدت أطفال طيف التوحد ',
                    style: TextStyle(
                        color: Color(0xffE1E2E9),
                        fontFamily: 'Roboto',
                        height: 2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff8E9099), width: .5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/Icon button toggleable-dark.png',
                          width: 56,
                          height: 56,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'PDF',
                          style: TextStyle(
                            color: Color(0xffFFB4AB),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'ارفع ملف تعريف الهوية بصيغة ',
                          style: textOnBoarding2,
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      defaultButton(
                          text: 'التالي', function: () {}, radius: 50),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Color(0xffA8C8FF),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(70),
                      //     ),
                      //   ),
                      //   child: GestureDetector(
                      //     onTap: () {},
                      //     child: Container(
                      //       width: 79,
                      //       height: 40,
                      //       child: Center(
                      //         child: Text(
                      //           'التالي',
                      //           style: TextStyle(
                      //               color: Color(0xff05305F),
                      //               fontSize: 14,
                      //               fontFamily: 'Roboto',
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Column(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   // crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: 700,
          //       height: 404,
          //     ),
          //     Image.asset(
          //       'assets/Icon button toggleable-dark.png',
          //       height: 48,
          //       width: 48,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
