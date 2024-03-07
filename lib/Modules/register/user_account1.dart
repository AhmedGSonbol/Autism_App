import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/modules/register/user_account2.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final TextEditingController nameCon = TextEditingController();

  //int only
  final TextEditingController ageCon = TextEditingController();

  final TextEditingController countryCon = TextEditingController();

  final TextEditingController stateCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsetsDirectional.all(30),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 83,
                ),
                Text(
                  'إنشاء حساب جديد',
                  style: TextStyle(
                      color: Color(0xffD9D9D9),
                      fontFamily: 'Roboto',
                      height: 2,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(90),
                                bottomLeft: Radius.circular(90),
                              ),
                              color: Color(0xff1d2024),
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  //convert here
                                },
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
                          ),
                          Container(
                            width: 110,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(90),
                                bottomRight: Radius.circular(90),
                              ),
                              color: Color(0xffA8C8FF),
                            ),
                            child: Center(
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
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'سجل ك',
                      style: TextStyle(
                          color: Color(0xffD6E3FF),
                          fontFamily: 'Roboto',
                          height: 2,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                defaultTextFormField(
                    controller: nameCon,
                    type: TextInputType.name,
                    isPrefix: false,
                    hint: 'الإسم',
                    validate: (value) {
                      if (value == '') {
                        return 'مطلوب*';
                      }
                    }),
                SizedBox(
                  height: 40,
                ),
                defaultTextFormField(
                    controller: ageCon,
                    type: TextInputType.number,
                    isPrefix: false,
                    hint: 'سن الطفل',
                    validate: (value) {
                      if (value == '') {
                        return '*مطلوب';
                      }
                    }),
                SizedBox(
                  height: 40,
                ),
                defaultTextFormField(
                    controller: countryCon,
                    type: TextInputType.text,
                    isPrefix: false,
                    hint: 'الدولة',
                    validate: (value) {
                      if (value == '') {
                        return '*مطلوب';
                      }
                    }),
                SizedBox(
                  height: 40,
                ),
                defaultTextFormField(
                    controller: stateCon,
                    type: TextInputType.text,
                    isPrefix: false,
                    hint: 'المحافظة',
                    validate: (value) {
                      if (value == '') {
                        return '*مطلوب';
                      }
                    }),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
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
                                return UserAccount2();
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
          ),
        ),
      ),
    );
  }
}
