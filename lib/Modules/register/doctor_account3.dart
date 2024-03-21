import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/Shared/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorAccount3 extends StatelessWidget
{
  const DoctorAccount3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:
      [
        Stack(
          alignment: Alignment.bottomRight,
          children:
          [
            Image.asset(
              'assets/images/account_circle.png',
              width: 120,
              height: 120,
            ),
            IconButton(
              icon: Image.asset('assets/images/Icon button toggleable-dark.png'),
              onPressed: (){},)
          ],
        ),
        const SizedBox(
          height: 20,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
              Expanded(
                child: Text(
                  'ارفع ملف تعريف الهوية',
                  style: onBoardingDesc,
                  maxLines: 1,


                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
