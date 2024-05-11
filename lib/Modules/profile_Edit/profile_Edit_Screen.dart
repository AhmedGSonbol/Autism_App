import 'package:autism/Shared/Constants/Constants.dart';
import 'package:autism/Shared/components/components.dart';
import 'package:autism/Shared/cubit/cubit.dart';
import 'package:autism/Shared/cubit/states.dart';
import 'package:autism/Shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Edit_Screen extends StatelessWidget
{
  Profile_Edit_Screen({Key? key,this.isAddAdmin = false}) : super(key: key);

  bool isAddAdmin;

  var nameController = TextEditingController();
  var countryController = TextEditingController();
  var governmentController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  //patient
  var childNameController = TextEditingController();
  var childAgeController = TextEditingController();

  //doctor
  var clinicController = TextEditingController();
  var aboutController = TextEditingController();

  //admin
  var emailController = TextEditingController();
  // var addNewPasswordController = TextEditingController();
  var confirmPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state)
      {
        if(state is SuccessAddAdminState)
        {
          myToast(msg: state.message, state: ToastStates.SUCCESS);
          nameController.clear();
          phoneController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPassController.clear();
        }
        else if(state is ErrorAddAdminState)
        {
          myToast(msg: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Stack(
          children: [
            Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                backgroundColor: const Color(0xff43474E),
                title:  Text(
                  isAddAdmin == false ?
                  'تعديل الملف الشخصي'
                      :
                  'إضافة مسئول جديد',
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
                                if(userType == 'admin')
                                {
                                  cubit.addAdmin(name: nameController.text, email: emailController.text, phone: phoneController.text, password: passwordController.text);
                                }
                              }
                            },
                            text:!isAddAdmin ? 'حفظ' : 'إضافة',
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
                    //User info
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xff43474E),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.0),
                              bottomLeft: Radius.circular(16.0))),
                      child: Center(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Hero(
                                  tag: 'profile_image',
                                  child: CircleAvatar(backgroundImage:
                                  (()
                                  {
                                    if(cubit.avatarImage != null)
                                    {
                                      return FileImage(cubit.avatarImage!) as ImageProvider;
                                    }
                                    else
                                    {
                                      return AssetImage('assets/images/Rectangle.png') as ImageProvider;

                                    }

                                  }()),
                                    radius: 100.0,
                                  ),
                                ),
                                cubit.avatarImage == null
                                    ?
                                IconButton(
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.upload,
                                      size: 20.0,
                                    ),
                                    backgroundColor: mainColor,
                                  ),
                                  onPressed: ()
                                  {//A8C8FF
                                    ///upload image
                                    cubit.pickImage();

                                  },
                                )
                                    :
                                IconButton(
                                  icon: const CircleAvatar(
                                    child: Icon(
                                      Icons.close,
                                      size: 20.0,
                                    ),
                                    backgroundColor: mainColor,
                                  ),
                                  onPressed: ()
                                  {
                                    ///delete image
                                    cubit.cancelUploadedProfileImage();

                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

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
                              hint: 'الأسم',
                            validate: (value) {
                              if (value == '') {
                                return 'مطلوب*';
                              }else if(value!.length < 5)
                              {
                                return 'الأسم يجب الا يقل عن 5 حروف !';
                              }
                            },
                            ),
                            if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),
                            if(userType != 'admin' && isAddAdmin == false)
                              defaultTextFormField(
                                controller: countryController,
                                type: TextInputType.name,
                                hint: 'الدولة'),
                            if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),if(userType != 'admin' && isAddAdmin == false)
                            defaultTextFormField(
                                controller: governmentController,
                                type: TextInputType.name,
                                hint: 'المحافظة'),
                            // if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),
                            // if(userType != 'admin' && isAddAdmin == false)
                            defaultTextFormField(
                                controller: phoneController,
                                type: TextInputType.phone,
                                hint: 'الهاتف',
                                validate: (value) {
                                  if (value == '') {
                                    return 'مطلوب*';
                                  }else if (value!.length != 11) {
                                    return 'رقم الهاتف يجب ان يكون 11 رقم !';
                                  }
                                }),
                            // if(userType != 'admin' && isAddAdmin == false)
                            const SizedBox(
                              height: 20.0,
                            ),
                            if(userType != 'admin')
                            userType == 'patient'
                                ?
                            defaultTextFormField(
                              controller: childNameController,
                              type: TextInputType.name,
                              hint: 'اسم الطفل',
                            )
                                :
                            defaultTextFormField(
                                controller: clinicController,
                                type: TextInputType.name,
                                hint: 'العيادة'
                            ),
                            if(userType != 'admin')
                            const SizedBox(
                              height: 20.0,
                            ),
                            if(userType != 'admin' && isAddAdmin == false)
                            userType == 'patient'
                                ?
                            defaultTextFormField(
                              controller: childAgeController,
                              type: TextInputType.number,
                              hint: 'عمر الطفل',
                            )
                            :
                            defaultTextFormField(
                                controller: aboutController,
                                type: TextInputType.name,
                                hint: 'التعريف',
                                maxLines: 3

                            ),
                            if(isAddAdmin == true)
                            defaultTextFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                hint: 'الإيميل',
                              validate: (value)
                              {
                                if (value == '') {
                                  return 'مطلوب*';
                                }else if(!value!.contains('@') || !value.contains('.') || value.length < 7)
                                {
                                  return 'برجاء كتابة الايميل بشكل صحيح !';
                                }
                              }
                            ),
                            if(isAddAdmin == true)
                            const SizedBox(
                              height: 20.0,
                            ),
                            if(isAddAdmin == true)
                            defaultTextFormField(
                                controller: passwordController,
                                type: TextInputType.name,
                                hint: 'الرقم السري',
                              validate: (value)
                              {
                                if (value == '') {
                                  return 'مطلوب*';
                                }else if (value!.length < 6) {
                                  return 'لا يمكن انشاء رقم سري اقل من 6 احرف او ارقام';
                                }
                              }
                            ),
                            if(isAddAdmin == true)
                            const SizedBox(
                              height: 20,
                            ),
                            if(isAddAdmin == true)
                            defaultTextFormField(
                                controller: confirmPassController,
                                type: TextInputType.text,

                                hint: 'تأكيد الرقم السري',
                                validate: (value) {
                                  if (value == '')
                                  {
                                    return 'مطلوب*';
                                  }
                                  else if(passwordController.text != value)
                                  {
                                    return 'برجاء إعادة كتابة كلمة السر بشكل صحيح !';
                                  }
                                }),



                            // const SizedBox(
                            //   height: 20.0,
                            // ),
                            // defaultTextFormField(
                            //   controller: passwordController,
                            //   type: TextInputType.name,
                            //   isPass: !cubit.isPassVisible,
                            //   label: 'الرقم السري',
                            //   iconButton: IconButton(
                            //     onPressed: () {
                            //       cubit.changePassVisibility();
                            //     },
                            //     icon: Icon(
                            //       cubit.isPassVisible
                            //           ? Icons.visibility
                            //           : Icons.visibility_off,
                            //       color: fontColor,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if(state is LoadingAddAdminState)
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
