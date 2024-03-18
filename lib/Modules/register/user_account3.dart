import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAccount3 extends StatelessWidget {
  const UserAccount3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          'تهانينا, لقد إكتمل إنشاء حسابك',
          style: TextStyle(
              color: Color(0xffE1E2E9),
              fontFamily: 'Roboto',
              height: 2,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'و الأن ستبدأ الرحلة',
          style: TextStyle(
              color: Color(0xffE1E2E9),
              fontFamily: 'Roboto',
              height: 2,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 166,
        ),


      ],
    );
  }
}
