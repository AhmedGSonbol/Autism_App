import 'package:autism/Modules/register/cubit/register_Cubit.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/modules/register/user_account3.dart';
import 'package:flutter/material.dart';

class UserAccount1 extends StatelessWidget
{
  UserAccount1({super.key,required this.formKey ,required this.cubit,required this.nameCon ,required this.ageCon ,required this.countryCon ,required this.governmentCon});

  TextEditingController nameCon ;
  TextEditingController ageCon;
  final TextEditingController countryCon ;
  final TextEditingController governmentCon ;

  var formKey ;

  RegisterCubit cubit;

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
              onSaved: (ss)
              {
                print('1111111');
              },
              hint: 'الأسم',
              validate: (value) {
                if (value == '') {
                  print('asdasa');

                  return 'مطلوب*';
                }else
                {
                  print(value);
                }
              }),
          const SizedBox(
            height: 40,
          ),
          defaultTextFormField(
              onSaved: (ss)
              {
                print('22222');
              },
              controller: ageCon,
              type: TextInputType.number,

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
