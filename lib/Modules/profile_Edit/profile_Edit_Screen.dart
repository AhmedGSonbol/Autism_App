import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Edit_Screen extends StatelessWidget
{
  Profile_Edit_Screen({Key? key}) : super(key: key);


  var nameController = TextEditingController();
  var countryController = TextEditingController();
  var governmentController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: const Color(0xff43474E),
            title: const Text('الملف الشخصي',style: TextStyle(color: fontColor),),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: fontColor,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            height: 100,
            color: Colors.transparent,
            elevation: 0,
            child: Column(children:
            [
              const Divider(
                thickness: .5,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:
                  [
                      defaultElevatedButton(
                        onPressed: ()
                        {

                        },
                        text: 'إلغاء',
                        color: const Color(0xffDBBCE1),
                        textColor: const Color(0xff3E2845),
                      ),
                    const SizedBox(
                      width: 15,
                    ),
                    defaultElevatedButton(
                      onPressed: ()
                      {
                        if(formKey.currentState!.validate())
                        {

                        }
                      },
                      text: 'حفظ',
                    ),
                  ],
                ),
              ),
            ],),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 30.0),

            child: Column(
              children:
              [
                //User info
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff43474E),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0),bottomLeft: Radius.circular(16.0))
                  ),
                  child: Center(
                    child: Column(
                      children:
                      [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children:
                          [
                            Hero(
                            tag: 'profile_image',
                              child: Image.asset(
                                fit: BoxFit.cover,
                                'assets/images/Rectangle.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/Icon button toggleable-dark.png'),
                              onPressed: (){},)
                          ],
                        ),
                        const SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20.0,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: formKey,
                    child: Column(

                      children:
                      [
                        defaultTextFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            isPrefix: false,

                          label: 'الأسم',
                        ),

                        const SizedBox(height: 20.0,),


                        defaultTextFormField(
                            controller: countryController,
                            type: TextInputType.name,
                            isPrefix: false,

                            label: 'الدولة'
                        ),
                        const SizedBox(height: 20.0,),


                        defaultTextFormField(
                            controller: governmentController,
                            type: TextInputType.name,
                            isPrefix: false,

                            label: 'المحافظة'
                        ),
                        const SizedBox(height: 20.0,),


                        defaultTextFormField(
                            controller: phoneController,
                            type: TextInputType.name,
                            isPrefix: false,

                            label: 'الهاتف'
                        ),
                        const SizedBox(height: 20.0,),


                        defaultTextFormField(
                            controller: passwordController,
                            type: TextInputType.name,
                            isPrefix: false,
                            isPass: true,

                            label: 'الرقم السري'
                        ),

                      ],
                    ),
                  ),
                )


              ],
            ),
          ),
        );

      },
    );
  }
}
