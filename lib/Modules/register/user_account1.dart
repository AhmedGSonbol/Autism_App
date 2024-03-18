import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/modules/register/user_account3.dart';
import 'package:flutter/material.dart';

class UserAccount1 extends StatelessWidget
{
  UserAccount1({super.key,required this.formKey});

  final TextEditingController nameCon = TextEditingController();
  final TextEditingController ageCon = TextEditingController();
  final TextEditingController countryCon = TextEditingController();
  final TextEditingController governmentCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
        [

          defaultTextFormField(
              controller: nameCon,
              type: TextInputType.name,
              isPrefix: false,
              hint: 'الأسم',
              validate: (value) {
                if (value == '') {
                  return 'مطلوب*';
                }
              }),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              controller: ageCon,
              type: TextInputType.number,
              isPrefix: false,
              hint: 'سن الطفل',
              validate: (value) {
                if (value == '') {
                  return 'مطلوب*';
                }
              }),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              controller: countryCon,
              type: TextInputType.text,
              isPrefix: false,
              hint: 'الدولة',
              validate: (value) {
                if (value == '') {
                  return 'مطلوب*';
                }
              }),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              controller: governmentCon,
              type: TextInputType.text,
              isPrefix: false,
              hint: 'المحافظة',
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
