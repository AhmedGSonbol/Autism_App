import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/modules/register/user_account3.dart';
import 'package:flutter/material.dart';

class DoctorAccount2 extends StatelessWidget
{
  DoctorAccount2({super.key,required this.formKey});

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
        children:
        [
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
        ],
      ),
    );
  }
}
