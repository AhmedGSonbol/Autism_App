import 'package:autism/Modules/register/user_account1.dart';
import 'package:autism/Modules/register/user_account3.dart';
import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/modules/register/user_account2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register_Screen extends StatelessWidget
{
  Register_Screen({super.key});

  final TextEditingController nameCon = TextEditingController();

  //int only
  final TextEditingController ageCon = TextEditingController();

  final TextEditingController countryCon = TextEditingController();

  final TextEditingController stateCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<Widget> screens =
  [
    UserAccount1(),
    UserAccount2(),
    UserAccount3(),
  ];

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
    listener: (context, state) {},
    builder: (context, state)
    {

      var cubit = AppCubit.get(context);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsetsDirectional.all(30),
          child: SingleChildScrollView(
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
                    height: 2,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),

                  child: NavigationBarTheme(
                    data: NavigationBarThemeData(
                      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                            (Set<MaterialState> states) => states.contains(MaterialState.selected)
                            ? const TextStyle(color: Colors.red)
                            : const TextStyle(color: Colors.black),
                      )
                    ),
                    child: NavigationBar(
                      height: 60.0,

                      backgroundColor: Colors.blue,
                      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                      selectedIndex: cubit.currentRegScreen,
                      destinations:
                      [
                        NavigationDestination(icon: SizedBox(), label: 'ss',),
                        NavigationDestination(icon: Icon(Icons.add), label: 'ss'),
                      ],
                      // [
                      //   Container(
                      //     color: Colors.red,
                      //     child: Center(
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children:
                      //         [
                      //           Text('طبيب',style: TextStyle(color: fontColor),),
                      //           if(cubit.currentRegScreen != 0)
                      //             Icon(Icons.check,color: fontColor,)
                      //         ],),
                      //     ),
                      //   ),
                      //   Container(
                      //     color: Colors.green,
                      //     child: Center(
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children:
                      //         [
                      //           Text('أب / أم',style: TextStyle(color: fontColor)),
                      //           if(cubit.currentRegScreen == 0)
                      //             Icon(Icons.check,color: fontColor,)
                      //         ],),
                      //     ),
                      //   ),
                      //
                      // ],
                      surfaceTintColor: Colors.yellowAccent,
                      indicatorColor: Colors.greenAccent,
                      onDestinationSelected: (index)
                      {
                        print('ssssssssssssss');
                        print(index);
                      },
                    ),
                  ),
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
      );

    },
    );
  }
}
