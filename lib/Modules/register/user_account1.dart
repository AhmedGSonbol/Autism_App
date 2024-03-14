import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/modules/register/user_account3.dart';
import 'package:flutter/material.dart';

class UserAccount1 extends StatelessWidget
{
  UserAccount1({super.key});

  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 83,
          ),
          const Text(
            'إنشاء حساب جديد',
            style: TextStyle(
                color: Color(0xffD9D9D9),
                fontFamily: 'Roboto',
                height: 2,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    color: Colors.grey),
                width: 220,
                height: 47,
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      height: 45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90),
                          bottomLeft: Radius.circular(90),
                        ),
                        color: Color(0xff1d2024),
                      ),
                      child: const Center(
                        child: Text(
                          'طبيب',
                          style: TextStyle(
                              color: Color(0xff8E9099),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(90),
                          bottomRight: Radius.circular(90),
                        ),
                        color: Color(0xffA8C8FF),
                      ),
                      child: const Center(
                        child: Text(
                          'أب / أم',
                          style: TextStyle(
                              color: Color(0xff273141),
                              fontSize: 16,
                              height: 2,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'أكمل ك',
                style: TextStyle(
                    color: Color(0xffD6E3FF),
                    fontFamily: 'Roboto',
                    height: 2,
                    fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              controller: phoneCon,
              type: TextInputType.phone,
              isPrefix: false,
              hint: 'الهاتف',
              validate: (value) {
                if (value == '') {
                  return 'مطلوب*';
                }
              }),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              controller: emailCon,
              type: TextInputType.number,
              isPrefix: false,
              hint: 'الإيميل',
              validate: (value) {
                if (value == '') {
                  return 'مطلوب*';
                }
              }),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              controller: passCon,
              type: TextInputType.text,
              isPrefix: false,
              hint: 'إنشاء الرقم سري',
              validate: (value) {
                if (value == '') {
                  return 'مطلوب*';
                }
              }),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              controller: confirmPassCon,
              type: TextInputType.text,
              isPrefix: false,
              hint: 'تأكيد الرقم السري',
              validate: (value) {
                if (value == '') {
                  return 'مطلوب* ';
                }
              }),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              defaultButton(
                text: 'التالي',
                radius: 50,
                function: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) {
                          return const UserAccount3();
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
