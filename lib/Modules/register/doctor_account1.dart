import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/modules/register/user_account3.dart';
import 'package:flutter/material.dart';

class DoctorAccount1 extends StatelessWidget
{

  final TextEditingController nameCon = TextEditingController();
  final TextEditingController specialistCon = TextEditingController();
  final TextEditingController countryCon = TextEditingController();
  final TextEditingController governmentCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  DoctorAccount1({super.key , required this.formKey});

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
              controller: specialistCon,
              type: TextInputType.text,

              hint: 'التخصص',
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
