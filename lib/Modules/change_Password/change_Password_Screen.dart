import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:autism/generated/l10n.dart';
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
    var la = S.of(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state)
      {
        if(state is SuccessUpdatePasswordState)
        {
          myToast(msg: la.updateSuccessMessage, state: ToastStates.SUCCESS);

          oldPassController.clear();
          reTryNewPassController.clear();
          newPassController.clear();
        }
        else if(state is ErrorUpdatePasswordState)
        {
          myToast(msg: la.updateErrorMessage, state: ToastStates.ERROR);
        }

      },
      builder: (context, state)
      {
        AppColors colors = AppColors(context);

        var cubit = AppCubit.get(context);

        return Stack(
          children:
          [
            Scaffold(
              appBar: AppBar(
                title:  Text(

                  la.changePasswordTitle,
                  style: TextStyle(color: colors.fontColor()),
                ),
                leading: IconButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: colors.fontColor(),
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
                            text: la.cancelButton,
                            color: appRedColor,
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
                            text:la.updateButton,
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
                              context: context,
                              controller: oldPassController,
                              type: TextInputType.name,
                              hint: la.oldPasswordLabel,
                              validate: (value)
                              {
                                if (value == '')
                                {
                                  return la.Required;
                                }
                              },
                            ),

                              const SizedBox(
                                height: 20.0,
                              ),

                              defaultTextFormField(
                                  context: context,
                                  controller: newPassController,
                                  type: TextInputType.name,
                                  hint: la.newPasswordLabel,
                                validate: (value)
                                {
                                  if (value == '') {
                                    return la.Required;
                                  }else if (value!.length < 6) {
                                    return la.newPasswordLengthError;
                                  }
                                }
                              ),

                            const SizedBox(
                              height: 20.0,
                            ),

                            defaultTextFormField(
                                context: context,
                                controller: reTryNewPassController,
                                type: TextInputType.name,
                                hint: la.confirmPasswordLabel,
                                validate: (value)
                                {
                                  if (value == '')
                                  {
                                    return la.Required;
                                  }
                                  else if(newPassController.text != value)
                                  {
                                    return la.confirmPasswordError;
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
