import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Change_Password_Screen extends StatelessWidget {
   Change_Password_Screen({Key? key}) : super(key: key);


  var oldPassController = TextEditingController();
  var newPassController = TextEditingController();
  var reTryNewPassController = TextEditingController();

   var formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state)
      {
        if(state is SuccessUpdatePasswordState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);

          oldPassController.clear();
          reTryNewPassController.clear();
          newPassController.clear();
        }
        else if(state is ErrorUpdatePasswordState)
        {
          myToast(msg: state.message, state: ToastStates.ERROR);
        }

      },
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Stack(
          children:
          [
            Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                backgroundColor: const Color(0xff43474E),
                title:  Text(

                  'تعديل الرقم السري',
                  style: TextStyle(color: fontColor),
                ),
                leading: IconButton(
                  onPressed: ()
                  {
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
                child: Column(
                  children: [
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
                        children: [
                          defaultElevatedButton(
                            onPressed: ()
                            {
                              Navigator.of(context).pop();
                            },
                            text: 'إلغاء',
                            color: const Color(0xffDBBCE1),
                            textColor: const Color(0xff3E2845),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          defaultElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate())
                              {
                                cubit.updatePassword(oldPassword: oldPassController.text, newPassword: newPassController.text);
                              }
                            },
                            text:'تعديل',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(

                padding: EdgeInsets.only(bottom: 30.0),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children:
                          [
                            const SizedBox(
                              height: 20.0,
                            ),

                            defaultTextFormField(

                              controller: oldPassController,
                              type: TextInputType.name,
                              hint: 'الرقم السري القديم',
                              validate: (value)
                              {
                                if (value == '') {
                                  return 'مطلوب*';
                                }
                              },
                            ),

                              const SizedBox(
                                height: 20.0,
                              ),

                              defaultTextFormField(
                                  controller: newPassController,
                                  type: TextInputType.name,
                                  hint: 'الرقم السري الجديد',
                                validate: (value)
                                {
                                  if (value == '') {
                                    return 'مطلوب*';
                                  }else if (value!.length < 6) {
                                    return 'لا يمكن انشاء رقم سري اقل من 6 احرف او ارقام';
                                  }
                                }
                              ),

                            const SizedBox(
                              height: 20.0,
                            ),

                            defaultTextFormField(
                                controller: reTryNewPassController,
                                type: TextInputType.name,
                                hint: 'إعادة كتابة الرقم السري الجديد',
                                validate: (value)
                                {
                                  if (value == '')
                                  {
                                    return 'مطلوب*';
                                  }
                                  else if(newPassController.text != value)
                                  {
                                    return 'برجاء إعادة كتابة كلمة السر بشكل صحيح !';
                                  }
                                }
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if(state is LoadingUpdatePasswordState)
              Positioned.fill(
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(color: mainColor,),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
